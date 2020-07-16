#! / usr / bin / env rubis

require 'nokogiri'
require 'open-uri'
# Récupérer et analyser le document HTML 
#doc  =  Nokogiri :: HTML ( URI . Open ( 'https://nokogiri.org/tutorials/installing_nokogiri.html' ) )
# Boucle pour chaque ligne de crypto
def get_cryto
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    results = []
    doc.xpath('//table/tbody/tr').each do |row|
      # Accéeder colonnes qu'on n'a besoin 
      cryto_name_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__symbol")]')
      price_node = row.at_xpath('td[contains(@class,"cmc-table__cell--sort-by__price")]/a')
    
      cryto_name = cryto_name_node.text
      price = price_node.text[1..-1]
    
      hash  =  Hash.new
      hash[cryto_name] = price
      results.push(hash)
      
    end
    return results
  end
  
  
  
