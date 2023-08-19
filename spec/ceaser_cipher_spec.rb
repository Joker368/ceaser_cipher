# frozen_string_literal: true

RSpec.describe CeaserCipher do
  it 'encodes phrase into cipher' do
    expect(TheOdinProject::CeaserCipher.new(5, phrase: '321!Pizza123.').cipher).to eq('321!Kduuv123.')
  end

  it 'decodes cipher into phrase' do
    expect(TheOdinProject::CeaserCipher.new(5, cipher: '321!Kduuv123.').phrase).to eq('321!Pizza123.')
  end
end
