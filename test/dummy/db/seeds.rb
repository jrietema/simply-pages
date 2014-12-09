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
# Page
content = <<HTML
<h1>Welcome, Tester!</h1>
<img src="/assets/simply_pages/files/1/question_key.resized.jpg" class="float-left" alt="">
<p>Here you can satisfy all you testing needs!</p>
HTML
page = SimplyPages::Page.create(title: 'Welcome', slug: 'welcome', content: content)
puts "Created #{page}"
page2 = SimplyPages::Page.create(title: 'About', slug: 'about', content: '<em>TODO: write something...</em>')
puts "Created #{page2}"

