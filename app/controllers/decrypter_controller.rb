require 'aes'

class DecrypterController < ApplicationController
  def decrypt
    @decrypted_content = flash[:decrypted_content]
    @error_message = flash[:error_message]
  end

  def upload
    if params[:encrypted_file].present?
      uploaded_file = params[:encrypted_file]
      encrypted_data = uploaded_file.read

      key = "manus"

      begin
        decrypted_text = AES.decrypt(encrypted_data, key)
        flash[:decrypted_content] = decrypted_text 
        flash[:notice] = "Dosya başarıyla çözüldü."
      rescue => e
        flash[:error_message] = "Şifre çözme sırasında bir hata oluştu: #{e.message}"
        flash[:alert] = "Şifre çözme başarısız oldu."
      end
    else
      flash[:error_message] = "Lütfen bir dosya seçin."
      flash[:alert] = "Dosya seçilmedi."
    end

  
    redirect_to root_path 
  end
end