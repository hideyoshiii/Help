class PagesController < ApplicationController
  def index
  end

  def notification
    @notifications = Notification.where(user_id: current_user.id).all.reverse_order
    Notification.where(user_id: current_user.id).update_all(:read => true)
  end


  def about
  end

  def flow
  end

  def terms
  end

  def privacy
  end

  def law
  end

  def search

  	@listings = Listing.where(active: true).all.reverse_order

  	# Ransack q のチェックボックス一覧
    if params[:q].present? 


      if params[:q][:format_eq_any].present?
        session[:format_eq_any] = params[:q][:format_eq_any]
        session[:Meeting] = session[:format_eq_any].include?("対面")
        session[:Online] = session[:format_eq_any].include?("オンライン")
        session[:Telephone] = session[:format_eq_any].include?("電話")
        session[:Message] = session[:format_eq_any].include?("メッセージ")
      else
        session[:format_eq_any] = ""
        session[:Meeting] = false
        session[:Online] = false
        session[:Telephone] = false
        session[:Message] = false
      end

      if params[:q][:category_eq_any].present?
        session[:category_eq_any] = params[:q][:category_eq_any]
        session[:Wrinting] = session[:category_eq_any].include?("執筆代行")
        session[:Reading] = session[:category_eq_any].include?("読書代行")
        session[:Investigate] = session[:category_eq_any].include?("調べもの代行")
        session[:Gaming] = session[:category_eq_any].include?("ゲーム代行")
        session[:Pachinko] = session[:category_eq_any].include?("パチンコ行列代行")
        session[:Food] = session[:category_eq_any].include?("飲食店行列代行")
        session[:Consultation] = session[:category_eq_any].include?("話し相手代行")
        session[:Girlfriend] = session[:category_eq_any].include?("彼氏彼女代行")
        session[:Couple] = session[:category_eq_any].include?("夫婦代行")
        session[:Friends] = session[:category_eq_any].include?("友達代行")
        session[:Walk] = session[:category_eq_any].include?("ペットの世話代行")
        session[:Clean] = session[:category_eq_any].include?("掃除代行")
        session[:Shopping] = session[:category_eq_any].include?("買い物代行")
        session[:Grave] = session[:category_eq_any].include?("墓参り代行")
        session[:Moving] = session[:category_eq_any].include?("引っ越し代行")
        session[:Cuisine] = session[:category_eq_any].include?("料理代行")
        session[:Care] = session[:category_eq_any].include?("介護代行")
        session[:Extra] = session[:category_eq_any].include?("エキストラ代行")
        session[:Trip] = session[:category_eq_any].include?("旅行プラン作成代行")
        session[:Dating] = session[:category_eq_any].include?("デートプラン作成代行")
        session[:Plastic] = session[:category_eq_any].include?("プラモデル作成代行")
        session[:Homework] = session[:category_eq_any].include?("宿題代行")
        session[:Movie] = session[:category_eq_any].include?("動画編集・作成代行")
        session[:Document] = session[:category_eq_any].include?("資料作成代行")
        session[:Reservation] = session[:category_eq_any].include?("店決め・予約代行")
        session[:Other] = session[:category_eq_any].include?("その他代行")
        
      else
        session[:category_eq_any] = ""
        session[:Wrinting] = false
        session[:Reading] = false
        session[:Investigate] = false
        session[:Gaming] = false
        session[:Pachinko] = false
        session[:Food] = false
        session[:Consultation] = false
        session[:Girlfriend] = false
        session[:Couple] = false
        session[:Friends] = false
        session[:Walk] = false
        session[:Clean] = false
        session[:Shopping] = false
        session[:Grave] = false
        session[:Moving] = false
        session[:Cuisine] = false
        session[:Care] = false
        session[:Extra] = false
        session[:Trip] = false
        session[:Dating] = false
        session[:Plastic] = false
        session[:Homework] = false
        session[:Movie] = false
        session[:Document] = false
        session[:Reservation] = false
        session[:Other] = false
        
        
      end


      if params[:q][:area_eq_any].present?
        session[:area_eq_any] = params[:q][:area_eq_any]
        session[:Internet] = session[:area_eq_any].include?("インターネット")
        session[:Hokkaido] = session[:area_eq_any].include?("北海道")
        session[:Aomori] = session[:area_eq_any].include?("青森")
        session[:Iwate] = session[:area_eq_any].include?("岩手")
        session[:Miyagi] = session[:area_eq_any].include?("宮城")
        session[:Akita] = session[:area_eq_any].include?("秋田")
        session[:Yamagata] = session[:area_eq_any].include?("山形")
        session[:Fukushima] = session[:area_eq_any].include?("福島")
        session[:Ibaraki] = session[:area_eq_any].include?("茨城")
        session[:Tochigi] = session[:area_eq_any].include?("栃木")
        session[:Gunma] = session[:area_eq_any].include?("群馬")
        session[:Saitama] = session[:area_eq_any].include?("埼玉")
        session[:Chiba] = session[:area_eq_any].include?("千葉")
        session[:Tokyo] = session[:area_eq_any].include?("東京")
        session[:Knagawa] = session[:area_eq_any].include?("神奈川")
        session[:Niigata] = session[:area_eq_any].include?("新潟")
        session[:Toyama] = session[:area_eq_any].include?("富山")
        session[:Ishikawa] = session[:area_eq_any].include?("石川")
        session[:Fukui] = session[:area_eq_any].include?("福井")
        session[:Yamanashi] = session[:area_eq_any].include?("山梨")
        session[:Nagano] = session[:area_eq_any].include?("長野")
        session[:Gifu] = session[:area_eq_any].include?("岐阜")
        session[:Shizuoka] = session[:area_eq_any].include?("静岡")
        session[:Aichi] = session[:area_eq_any].include?("愛知")
        session[:Mie] = session[:area_eq_any].include?("三重")
        session[:Shiga] = session[:area_eq_any].include?("滋賀")
        session[:Kyoto] = session[:area_eq_any].include?("京都")
        session[:Osaka] = session[:area_eq_any].include?("大阪")
        session[:Hyogo] = session[:area_eq_any].include?("兵庫")
        session[:Nara] = session[:area_eq_any].include?("奈良")
        session[:Wakayama] = session[:area_eq_any].include?("和歌山")
        session[:Tottori] = session[:area_eq_any].include?("鳥取")
        session[:Shimane] = session[:area_eq_any].include?("島根")
        session[:Okayama] = session[:area_eq_any].include?("岡山")
        session[:Hiroshima] = session[:area_eq_any].include?("広島")
        session[:Yamaguchi] = session[:area_eq_any].include?("山口")
        session[:Tokushima] = session[:area_eq_any].include?("徳島")
        session[:Kagawa] = session[:area_eq_any].include?("香川")
        session[:Ehime] = session[:area_eq_any].include?("愛媛")
        session[:Kouchi] = session[:area_eq_any].include?("高知")
        session[:Fukuoka] = session[:area_eq_any].include?("福岡")
        session[:Saga] = session[:area_eq_any].include?("佐賀")
        session[:Nagasaki] = session[:area_eq_any].include?("長崎")
        session[:Kumamoto] = session[:area_eq_any].include?("熊本")
        session[:Oita] = session[:area_eq_any].include?("大分")
        session[:Miyazaki] = session[:area_eq_any].include?("宮崎")
        session[:Kagoshima] = session[:area_eq_any].include?("鹿児島")
        session[:Okinawa] = session[:area_eq_any].include?("沖縄")
        session[:Overseas] = session[:area_eq_any].include?("海外")
      else
        session[:area_eq_any] = ""
        session[:Internet] = false
        session[:Hokkaido] = false
        session[:Aomori] = false
        session[:Iwate] = false
        session[:Miyagi] = false
        session[:Akita] = false
        session[:Yamagata] = false
        session[:Fukushima] = false
        session[:Ibaraki] = false
        session[:Tochigi] = false
        session[:Gunma] = false
        session[:Saitama] = false
        session[:Chiba] = false
        session[:Tokyo] = false
        session[:Knagawa] = false
        session[:Niigata] = false
        session[:Toyama] = false
        session[:Ishikawa] = false
        session[:Fukui] = false
        session[:Yamanashi] = false
        session[:Nagano] = false
        session[:Gifu] = false
        session[:Aichi] = false
        session[:Mie] = false
        session[:Shiga] = false
        session[:Kyoto] = false
        session[:Osaka] = false
        session[:Hyogo] = false
        session[:Nara] = false
        session[:Wakayama] = false
        session[:Tottori] = false
        session[:Shimane] = false
        session[:Okayama] = false
        session[:Hiroshima] = false
        session[:Yamaguchi] = false
        session[:Tokushima] = false
        session[:Kagawa] = false
        session[:Ehime] = false
        session[:Kouchi] = false
        session[:Fukuoka] = false
        session[:Saga] = false
        session[:Nagasaki] = false
        session[:Kumamoto] = false
        session[:Oita] = false
        session[:Miyazaki] = false
        session[:Kagoshima] = false
        session[:Okinawa] = false
        session[:Overseas] = false
      end


      

      
    end 

    # Q条件をまとめたものをセッションQに入れる
    session[:q] = {"format_eq_any"=>session[:format_eq_any], "category_eq_any"=>session[:category_eq_any], "area_eq_any"=>session[:area_eq_any]}


    # ransack検索
    @search = @listings.ransack(session[:q])
    @result = @search.result(distinct: true)

     #リスティングデータを配列にしてまとめる 
    @arrlistings = @result.to_a

  end

end
