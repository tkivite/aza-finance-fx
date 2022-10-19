class ApplicationController < ActionController::API
#     def not_found
#         render json: { error: 'not_found' }
#     end
    
#     def authorize_request
#         header = request.headers['Authorization']
#         header = header.split(' ').last if header
#         begin
#             @decoded = JsonWebToken.decode(header)
#             @current_user = User.find(@decoded[:user_id])
#         rescue ActiveRecord::RecordNotFound => e
#             render json: { errors: e.message }, status: :unauthorized
#         rescue JWT::DecodeError => e
#             render json: { errors: e.message }, status: :unauthorized
#         end
#     end
# end


 # Authenticate all requests
 before_action :authenticate_request

 # Enforces access right checks for individuals resources
#  after_action :verify_authorized, except: :index

 # Enforces access right checks for collections
#  after_action :verify_policy_scoped, only: :index

 attr_reader :current_user

 private

 def authenticate_request
   @current_user = AuthorizeApiRequest.call(request.headers).result
   unless @current_user
     render json: { error: 'Not Authenticated' }, status: 401
   end
 end
end