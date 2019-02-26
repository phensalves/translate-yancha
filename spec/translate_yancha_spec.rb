require 'spec_helper'
RSpec.describe 'GET api/v1.5/tr.json/translate (Translate)' do
  # Teste 1 (Translate)
  it 'Api response == 200' do
    textPt = 'Nós estamos testando o tradutor'
    yandexApi = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandexApi.translate textPt, 'en'
    expect(response['code']).to eq(200)
  end

  it 'translated text match' do
    textPt = 'Nós estamos testando o tradutor'
    textEn = 'We are testing the translator'
    yandexApi = TranslateYandex::Yandex.new TEST_API_KEY
    response = yandexApi.translate textPt, 'en'

    expect(response['text'].first).to eq(textEn)
  end
end
