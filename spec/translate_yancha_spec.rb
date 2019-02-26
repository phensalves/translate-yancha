require 'spec_helper'
RSpec.describe TranslateYancha do
  # Teste 1 (Translate)
  describe 'GET api/v1.5/tr.json/translate (Translate)' do
    it 'Api response == 200' do
      textPt = 'Nós estamos testando o tradutor'
      yanchaApi = TranslateYancha::Yancha.new ENV['YANCHA_TEST_API_KEY']
      response = yanchaApi.translate textPt, 'en'
      expect(response['code']).to eq(200)
    end

    it 'translated text match' do
      textPt = 'Nós estamos testando o tradutor'
      textEn = 'We are testing the translator'
      yanchaApi = TranslateYancha::Yancha.new ENV['YANCHA_TEST_API_KEY']
      response = yanchaApi.translate textPt, 'en'

      expect(response['text'].first).to eq(textEn)
    end
  end

  # Teste 2 (supported list of languages)
  describe "GET api/v1.5/tr.json/getLangs (Supported List)" do
    it "Api response not equal nil or empty '' " do
      yanchaApi = TranslateYancha::Yancha.new ENV['YANCHA_TEST_API_KEY']
      response = yanchaApi.list
      expect(response).not_to eq(nil)
      expect(response).not_to eq("")
    end
  end

  # Teste 3 (Language Detect)
  describe "GET api/v1.5/tr.json/detect (Detect)" do
    it "Api response == 200" do
      textPt = "Nós estamos testando o tradutor"
      yanchaApi = TranslateYancha::Yancha.new ENV['YANCHA_TEST_API_KEY']
      response = yanchaApi.detect textPt
      expect(response["code"]).to eq(200)
    end

    it "detect language match with right language" do
      textPt = "Nós estamos testando o tradutor"
      yanchaApi = TranslateYancha::Yancha.new ENV['YANCHA_TEST_API_KEY']
      response = yanchaApi.detect textPt
      expect(response["lang"]).to eq("pt")
    end
  end
end
