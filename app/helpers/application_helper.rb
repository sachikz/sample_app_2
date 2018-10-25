module ApplicationHelper
  
  #ページごとの完全なタイトルを返します
  def full_title(page_title = '')  #メソッド定義と、引数のデフォルト値設定
    base_title = "こども語録"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
