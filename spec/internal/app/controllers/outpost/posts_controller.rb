class Outpost::PostsController < Outpost::ResourceController
  define_list do |l|
    l.column :headline
    l.column :body
  end
end
