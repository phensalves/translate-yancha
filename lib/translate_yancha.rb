require 'translate_yancha/version'
require 'rest-client'
require 'json'

module TranslateYancha
  class Yancha

    def initialize(api_key)
      @api_key = api_key
    end

    def translate text, language
      result =  RestClient.get ENV['YANDEX_TRANSLATE_URL'], {params: {key: @api_key, 
                                                                      text: text, 
                                                                      format: 'plain', 
                                                                      lang: language
                                                                    }
                                                            }
      JSON.parse(result.body)
    end

    def list
      result =  RestClient.get ENV['YANDEX_GET_LANGS_URL'], {params: {key: @api_key}}
      JSON.parse(result.body)
    end

    def detect text
      result =  RestClient.get ENV['YANDEX_DETECT_URL'], {params: { key: @api_key, 
                                                                    text: text
                                                                  }
                                                          }
      JSON.parse(result.body)
    end
  end
end