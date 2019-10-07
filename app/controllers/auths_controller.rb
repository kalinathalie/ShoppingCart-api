class AuthsController < ApplicationController
	def create
		hmac_secret = '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e'
		payload = { data: params[:cart]}
		token = JWT.encode payload, hmac_secret, 'HS256'
		Purchase.new(token: token).save!
		render json: {token: token}
	end
end
