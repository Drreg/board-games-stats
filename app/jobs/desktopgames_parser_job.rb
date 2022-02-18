require 'net/http'

class DesktopgamesParserJob < ApplicationJob
  queue_as :default

  def parse(desktopgames, page = 1, max_page = nil)
    puts '='*100
    puts page
    puts '='*100
    url = desktopgames.link + 'catalog/boardgames/'
    url += "?page=#{page}" if page > 1
    uri = URI.parse(url)
    document = Net::HTTP.get(uri)
    doc = Nokogiri::HTML(document)

    doc.css('.product').each do |product|
      a = product.css('a')[0]
      game = Game.find_or_create_by(name: a['title'])
      link = a['href']
      link.slice!(0)
      price_div = product.css('.price .yell_price')[0]
      if price_div
        price_div.css('.goods_discount').remove
        price_div.css('sup').remove
        price = price_div.content.gsub(' ','').to_f

        game.game_prices.create(
          price: price,
          link: desktopgames.link + link,
          store: desktopgames
        )
      end
    end

    max_page = doc.css('.page_list a').children.last.content.to_i unless max_page
    return if page === max_page
    parse(desktopgames, page + 1, max_page)
  end

  def perform
    desktopgames = Store.where(name: 'desktopgames').first
    parse(desktopgames)
    DesktopgamesParserJob.set(wait_until: Time.now.tomorrow).perform_later
  end
end
