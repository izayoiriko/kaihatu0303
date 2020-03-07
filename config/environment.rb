# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# ページネーションの設定
WillPaginate::ViewHelpers.pagination_options[:previous_lavel] = '前ページ'
WillPaginate::ViewHelpers.pagination_options[:next_lavel] = '次ページ'
