require 'spec_helper'
describe "GET api/v1.5/tr.json/translate (Translate)" do
  it "has a version number" do
    expect(TranslateYancha::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  it "Api response == 200" do
    textPt = "Nós estamos testando o tradutor"
    yandexApi = TranslateYancha::Yancha.new YANCHA_TEST_API_KEY
    response = yandexApi.translate textPt, "en"
    expect(response["code"]).to eq(200)
  end

  it "Api response == 200" do
    textPt = "Nós estamos testando o tradutor"
    yandexApi = TranslateYancha::Yancha.new YANCHA_TEST_API_KEY
    response = yandexApi.translate textPt, "en"
    expect(response["code"]).to eq(200)
  end
end