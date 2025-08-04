Rails.application.routes.draw do
  root 'decrypter#decrypt' # Ana sayfa olarak decrypt formunu göster
  post 'decrypter/upload', to: 'decrypter#upload', as: :upload_decrypted_file
end