# This file should contain all the record creation needed to seed the database with its default values.
# rubocop:disable Layout/LineLength
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title1 = 'LIONEL MESSI, THE BEST EVER!'
text1 = '(born 24 June 1987) is an Argentine professional footballer who plays as a forward and captains both the Spanish club Barcelona and the Argentina national team. Often considered as the best player in the world and widely regarded as one of the greatest players of all time, Messi has won a record six Ballon dOr awards[note 2] and a record six European Golden Shoes. He has spent his entire professional career with Barcelona, where he has won a club-record 34 trophies, including ten La Liga titles, six Copa del Rey titles and four UEFA Champions Leagues.'
image1 = 'messi'

title2 = 'CRISTIANO RONALDO IN HEART'
text2 = 'Cristiano Ronaldo dos Santos Aveiro GOIH ComM (Portuguese pronunciation: [kɾiʃˈtjɐnu ʁɔˈnaɫdu]; born 5 February 1985) is a Portuguese professional footballer who plays as a forward for Serie A club Juventus and captains the Portugal national team. Often considered the best player in the world and widely regarded as one of the greatest players of all time, Ronaldo has won five Ballon dOr awards[note 3] and four European Golden Shoes, both of which are records for a European player. He has won 31 major trophies in his career, including seven league titles, five UEFA Champions Leagues, one UEFA European Championship, and one UEFA Nations League title.'
image2 = 'cristiano'

title3 = 'KAKA THE KING'
text3 = 'commonly known as Kaká (Portuguese: [kaˈka] (About this soundlisten)) or Ricardo Kaká,[3][4] is a Brazilian retired professional footballer who played as an attacking midfielder. Owing to his performances as a playmaker in his prime at A.C. Milan, a period marked by his creative passing, goal scoring and dribbles from midfield, Kaká is widely considered one of the best players of his generation.[5][6][7] With success at club and international level, he is one of eight players to have won the FIFA World Cup, the UEFA Champions League and the Ballon dOr.[8]'
image3 = 'kaka'

title4 = 'LEWANDOWISKI THE BIG STAR'
text4 = 'Robert Lewandowski (Polish pronunciation: [ˈrɔbɛrt lɛvanˈdɔfskʲi] (About this soundlisten); born 21 August 1988) is a Polish professional footballer who plays as a striker for Bundesliga club Bayern Munich and is the captain of the Poland national team. He is renowned for his positioning, technique and finishing, and is widely regarded as one of the best strikers in the world, and one of the best players in Bundesliga history. He has scored over 500 senior career goals for club and country.[4] After being the top scorer in the third and second tiers of Polish football with Znicz Pruszków, Lewandowski moved to top-flight Lech Poznań, helping the team win the 2009–10 Ekstraklasa.'
image4 = 'lewando'

title5 = 'WOW THIS IS BASKET'
text5 = 'Players advance the ball by bouncing it while walking or running (dribbling) or by passing it to a teammate, both of which require considerable skill. On offense, players may use a variety of shots—the lay-up, the jump shot, or a dunk; on defense, they may steal the ball from a dribbler, intercept passes, or block shots; either offense or defense may collect a rebound, that is, a missed shot that bounces from rim or backboard. It is a violation to lift or drag ones pivot foot without dribbling the ball, to carry it, or to hold the ball with both hands then resume dribbling.'
image5 = 'basketball2'

title6 = 'NOWADAYS CARS!!!!!'
text6 = 'Auto racing has existed since the invention of the automobile. Races of various sorts were organised, with the first recorded as early as 1867. Many of the earliest events were effectively reliability Auto racing (also known as car racing, motor racing,[1] or automobile racing) is a motorsport involving the racing of automobiles for competition. Auto racing has existed since the invention of the automobile. Races of various sorts were organised, with the first recorded as early as 1867. Many of the earliest events were effectively reliability trials, aimed at proving these new machines were a practical mode of transport, but soon became an important way for competing makers to demonstrate their machines. By the 1930s, specialist racing cars had developed. Different there are now numerous categories, each with different rules and regulations.'
image6 = 'car1'

title7 = 'STADIUM THING'
text7 = 'A stadium (plural stadiums or stadia) is a place or venue for (mostly) outdoor sports, concerts, or other events and consists of a field or stage either partly or completely surrounded by a tiered structure designed to allow spectators to stand or sit and view the event.'
image7 = 'stadium2'

Category.create(name: 'Football', priority: 1)
Category.create(name: 'Basketball', priority: 2)
Category.create(name: 'Cars', priority: 3)
Category.create(name: 'Stadiums', priority: 4)

User.create(name: 'Mohammed Atef')

User.first.articles.build(category_id: Category.find(1).id, title: title1, text: text1, image: image1).save
User.first.articles.build(category_id: Category.find(1).id, title: title2, text: text2, image: image2).save
User.first.articles.build(category_id: Category.find(1).id, title: title3, text: text3, image: image3).save
User.first.articles.build(category_id: Category.find(1).id, title: title4, text: text4, image: image4).save

User.first.articles.build(category_id: Category.find(2).id, title: title5, text: text5, image: image5).save

User.first.articles.build(category_id: Category.find(3).id, title: title6, text: text6, image: image6).save

User.first.articles.build(category_id: Category.find(4).id, title: title7, text: text7, image: image7).save

User.first.votes.build(article_id: Article.last.id).save
# rubocop:enable Layout/LineLength
