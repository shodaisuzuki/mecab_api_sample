require 'httpclient'
require 'json'

uri = "http://yapi.ta2o.net/apis/mecapi.cgi"

params = {
  sentence: "解析する文章",
  format: "json"
}

#proxy使用時
#proxy = http://proxy.XXX.co.jp:8080
#client = HTTPClient.new(proxy)

client = HTTPClient.new
request =  client.get(uri,params)
response = JSON.parse(request.body)

words = []
response.each do |res|
  word_list = res["feature"].split(",")
  words.concat(word_list[6..8]) if word_list[0] == "名詞"
end

p words.uniq