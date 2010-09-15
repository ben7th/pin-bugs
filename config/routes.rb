ActionController::Routing::Routes.draw do |map|
  map.resources :bugs do |bug|
    bug.resources :favorites
    bug.resources :comments,:controller=>"bug_comments",:collection=>{:newest=>:get}
  end

  # ----------------- 验证码 -------------------
  map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
end
