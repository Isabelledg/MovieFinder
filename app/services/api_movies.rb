require 'json'
require 'open-uri'
require 'uri'
require 'net/http'
require 'openssl'

class ApiMovies
    def getCountries
        country = {
            "country": "Portugal ",
            "id": 268,
            "countrycode": "PT"
        }

        return country
    end

    def searchMovies(countrylist)

        url = URI("https://unogsng.p.rapidapi.com/search?limit=100&countrylist=#{countrylist}&end_year=2019")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'unogsng.p.rapidapi.com'
        request["x-rapidapi-key"] = '4fe80065c7msh7fa3b07243c3b60p191500jsn6eb58724636c'

        response = http.request(request)

        results = JSON.parse(response.read_body)
        p results["results"]
        return results["results"]
    end
end


titles = ApiMovies.new
#268 is the portuguese contry code
movies_result = titles.searchMovies(268)
