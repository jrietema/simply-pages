 group = SimplyPages::FileGroup.create(title: 'Images', position: 0)
 puts "Created #{group.inspect}"
# Image outside of FileGroup folder
img1 = SimplyPages::File.new(title: 'Random Image')
img1.media = File.open(File.join(Rails.root, 'public/question_key.jpg'))
img1.save
puts "Created #{img1.inspect}"
# Image inside the FileGroup folder
img2 = SimplyPages::File.new(title: 'Anonymous User', file_group_id: group.id)
img2.media = File.open(File.join(Rails.root, 'public/missing_person.jpg'))
img2.save
puts "Created #{img2.inspect}"

