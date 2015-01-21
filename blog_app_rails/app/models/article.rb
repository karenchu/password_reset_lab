require 'typhoeus'

class Article < ActiveRecord::Base
	belongs_to :user
	
	def make_request
		request = Typhoeus::Request.new("http://access.alchemyapi.com/calls/text/TextGetRankedKeywords",
		method: :get,
		params: {apikey: "c182fc774f46693f426dea86a22b77e3a83dd169",
				text: content,
				maxRetrieve: 10,
				keywordExtractMode: "normal",
				outputMode: "json" },
		headers: {Accept: "text/html"}
		)
		request.run
		response = request.response
		keywordResults = JSON.parse(response.body)
		keyword = keywordResults["keywords"]
		relevance = keywordResults["relevance"]
		puts keywordResults
		return keyword
	end
end
