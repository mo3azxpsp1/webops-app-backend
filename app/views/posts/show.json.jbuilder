json.extract! @post, :id, :body, :user_id, :created_at
json.user @post.user.name
json.comments_count @post.comments.count
json.comments @post.comments.reverse do |comment|
	json.id comment.id
	json.time comment.created_at
	json.user comment.user.name
	json.body comment.body
end	
