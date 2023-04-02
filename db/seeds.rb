require 'faker'
Faker::Config.locale = 'en-GB'
base = "https://res.cloudinary.com/dzxuvey8d/image/upload/v1679101918/development/guitar_rental_seeds/"
fix = "https://res.cloudinary.com/dzxuvey8d/image/upload/v1679101905/development/guitar_rental_seeds/"

location = [
  "123 Buckingham Palace Rd, London SW1W 9SH",
  "5 Denmark St, London WC2H 8LP",
  "56 Rathbone Pl, London W1T 1JT",
  "London SW1A 1AA",
  "72 King St, Cambridge CB1 1LN",
  "Kings Road Arches, 127, Brighton BN1 2FN",
  "23 Carleton Rd, London N7 0QZ",
  "13 Leigh St, London WC1H 9EW",
  "47 Holywell Hill, St Albans AL1 1HD",
  "280 Westbourne Park Rd, London W11 1EF",
  "96 Weston Park, London N8 9PP",
  "Bridge Rd, Leigh Woods, Bristol BS8 3PA"
]

puts "Emptying database..."
Booking.destroy_all
Guitar.destroy_all
User.destroy_all

puts "Creating users..."
10.times do
  User.create!(
    email: "#{Faker::Hipster.unique.word}@gmail.com",
    password: "Password123!",
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    address: Faker::Address.postcode)
end
User.create!(
  email: "admin@gmail.com",
  password: "Admin123!",
  first_name: "Tom" ,
  last_name: "Brookes",
  address: "N8 0BD")
puts "Users created!"

puts "Creating guitars..."
guitar0 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Knoxville Butterscotch",
  caption: "Knoxville Semi-Hollow Electric Guitar",
  description: "The Knoxville Semi-Hollow Electric Guitar by Gear4music carries a unique vintage sounding tone and style beyond its years. Inspired by a classic F-hole design, this guitar offers professional features and high quality tonewoods at an affordable price. Boasting an attractive finish, this guitar can create a multitude of classic sounds on this versatile instrument.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar0.photos.attach(io: URI.open("#{base}knoxville0_co8edp.png"), filename: 'knoxville0.png')
guitar0.photos.attach(io: URI.open("#{base}knoxville2_ipfjl6.png"), filename: 'knoxville1.png')
guitar0.photos.attach(io: URI.open("#{base}knoxville2_ipfjl6.png"), filename: 'knoxville2.png')
guitar0.save
puts "#{Guitar.count} guitar saved..."

guitar1 = Guitar.new(
  user_id: User.all.sample.id,
  name: "LA Select Sky Blue",
  caption: "LA Select Electric Guitar HSS",
  description: "Modern features, classic styling. A premium upgrade to a definitive design. With the LA Select Electric Guitar HSS, you can join decades of musical history. No matter if it's your first step towards the Rock 'n' Roll Hall of Fame or if you've already made your deal at the crossroads. The LA Select is the guitar you'll want by your side.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar1.photos.attach(io: URI.open("#{base}LAselect0_mibjd1.png"), filename: 'LAselect0.png')
guitar1.photos.attach(io: URI.open("#{base}LAselect1_brvwse.png"), filename: 'LAselect1.png')
guitar1.photos.attach(io: URI.open("#{base}LAselect2_igvrn3.png"), filename: 'LAselect2.png')
guitar1.save
puts "#{Guitar.count} guitars saved"

guitar2 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Hartwood Revival Cherry Red",
  caption: "Hartwood Revival Vibrato Semi Acoustic Guitar",
  description: "The Hartwood Revival Semi Acoustic will bring a classic edge to your sound. Its iconic semi acoustic style is matched with an authentic feel and a warm, traditional tone. This model has been designed to make your sound stand out. With a classic neck and bridge humbucker configuration and parallel tonebar bracing, it produces a striking tone that will cut through the mix. It also delivers dynamic tonal possibilities thanks to a rich basswood body.",
  guitar_type: "Semi-Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar2.photos.attach(io: URI.open("#{base}umber0_ntstmi.png"), filename: 'umber0.png')
guitar2.photos.attach(io: URI.open("#{base}umber1_ucspss.png"), filename: 'umber1.png')
guitar2.photos.attach(io: URI.open("#{base}umber2_wbjq7f.png"), filename: 'umber2.png')
guitar2.save
puts "#{Guitar.count} guitars saved"

guitar3 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Hartwood Villanelle",
  caption: "Hartwood Villanelle Parlour, Satin Black",
  description: "Hartwood Villanelle is an ideal choice for players who prefer a smaller, slimmer body. The distinctive ivory effect pin stripe also sets off the guitars classic throwback design. You can enjoy an authentic and worn look and feel, with a vintage tone you can take to the stage.",
  guitar_type: "Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar3.photos.attach(io: URI.open("#{base}hartwood0_waukk1.png"), filename: 'hartwood0.png')
guitar3.photos.attach(io: URI.open("#{base}hartwood1_ikeu8d.png"), filename: 'hartwood1.png')
guitar3.photos.attach(io: URI.open("#{base}hartwood2_czeb38.png"), filename: 'hartwood2.png')
guitar3.save
puts "#{Guitar.count} guitars saved"

guitar4 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Fender Dreadnought",
  caption: "Fender CD-60 Dreadnought V3, 3-Color Sunburst",
  description: "Get your groove on. The Fender CD-60 Dreadnought V3 WN is a stunning example of how affordable guitars can still excel in sound and quality. Boasting top tonewoods and heaps of playability, it is perfect if you just want to pick up a guitar and jam. Containing a host of great features and a powerful, pristine tone, it is guaranteed to tickle the musical bones in your body. When you play it for the first time, you'll be inspired to write some seriously flavoursome songs.",
  guitar_type: "Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar4.photos.attach(io: URI.open("#{base}sunburst0_wt5kwa.png"), filename: 'sunburst0.png')
guitar4.photos.attach(io: URI.open("#{base}sunburst1_pemxeh.png"), filename: 'sunburst1.png')
guitar4.photos.attach(io: URI.open("#{base}sunburst2_ns3a9n.png"), filename: 'sunburst2.png')
guitar4.save
puts "#{Guitar.count} guitars saved..."

guitar5 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Fender PM-2 Parlor",
  caption: "Fender PM-2 Parlor Mahogany Acoustic, Natural",
  description: "Solid mahogany delivers a familiar warmth with superb bass and a present mid-range. It also has a range of features that make your tone grow. An open pore satin finish allows the PM-2 to have a surprisingly responsive nature. While a bone nut enhances sustain and resonance in a spectacular manner. You can also play with great comfort thanks to a compact parlour body and bound fingerboard edges. An instrument with a premium Fender feel, tone, and aesthetic.",
  guitar_type: "Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar5.photos.attach(io: URI.open("#{base}dark0_egwvqn.png"), filename: 'dark0.png')
guitar5.photos.attach(io: URI.open("#{base}dark1_qawgqr.png"), filename: 'dark1.png')
guitar5.photos.attach(io: URI.open("#{base}dark2_pp84tp.png"), filename: 'dark2.png')
guitar5.save
puts "#{Guitar.count} guitars saved..."

guitar6 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Seattle Bass",
  caption: "Seattle Bass Guitar, Red ",
  description: "The Seattle Bass Guitar features a jazz style body packed with grunge and surf tones. Complete with an attractive Red finish, this bass guitar has an offset body, maple neck with a poplar laminate fretboard and a set of PJ style pickups - a split coil pickup in the middle and a single coil at the bridge. Supplied with a free 1/4'' jack cable and gigbag as standard.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar6.photos.attach(io: URI.open("#{base}noddy0_qfakgc.png"), filename: 'noddy0.png')
guitar6.photos.attach(io: URI.open("#{base}noddy1_tc49ze.png"), filename: 'noddy1.png')
guitar6.photos.attach(io: URI.open("#{base}noddy2_og1hpd.png"), filename: 'noddy2.png')
guitar6.save
puts "#{Guitar.count} guitars saved..."

guitar7 = Guitar.new(
  user_id: User.all.sample.id,
  name: "LA Select Bass",
  caption: "LA Select Bass Guitar, Denim Burst",
  description: "The LA Select Bass Guitar is a must-have addition to any bass collection. Comprised of an ash body, the bass guitar offers a balanced sound with a gentle scoop in the midrange, making it perfect for Rock and Metal genres. Its lightweight design also ensures your performance is not restricted when on stage. The inclusion of a roasted maple neck and fretboard guarantees exceptional tuning stability and a rounded sound that compliments the PB Split Humbucker.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar7.photos.attach(io: URI.open("#{fix}striped0_s1izcc.png"), filename: 'striped0.png')
guitar7.photos.attach(io: URI.open("#{base}striped1_cejrar.png"), filename: 'striped1.png')
guitar7.photos.attach(io: URI.open("#{base}striped2_xelkb5.png"), filename: 'striped2.png')
guitar7.save
puts "#{Guitar.count} guitars saved..."

guitar8 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Brooklyn Select",
  caption: "Brooklyn Select Electric Guitar, Ivory",
  description: "The Brooklyn Select Electric Guitar by Gear4music was made for rock. Its powerful and instantly recognisable sound comes courtesy of three covered, humbucking pickups. With an industry-standard, Mahogany body, the Brooklyn's naturally organic tone is ideal for heavy riffing and soulful solos alike, while a comfy maple neck adds great tuning stability, and a biting, top end presence.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar8.photos.attach(io: URI.open("#{base}ivory0_uahvki.png"), filename: 'ivory0.png')
guitar8.photos.attach(io: URI.open("#{base}ivory1_zvd373.png"), filename: 'ivory1.png')
guitar8.photos.attach(io: URI.open("#{base}ivory2_lqhodu.png"), filename: 'ivory2.png')
guitar8.save
puts "#{Guitar.count} guitars saved..."

guitar9 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Yamaha Pacifica",
  caption: "Yamaha Pacifica 112V, Natural Satin",
  description: "Excel in any genre. Because the Yamaha Pacifica 112 VII hosts versatility in its nature. Equipped with a bridge alnico humbucker, players can kick out the hot, rich lead tones that defined the rock 'n' roll genre. And, combined with the snap and bite of a pair of single-coils, your chords will ooze with plenty of clarity and articulation. So whether you're unleashing fat, textured riffs or twangy cleans - the Pacifica will flourish, no matter your style.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar9.photos.attach(io: URI.open("#{base}nature0_oehkqp.png"), filename: 'nature0.png')
guitar9.photos.attach(io: URI.open("#{base}nature1_b2rrub.png"), filename: 'nature1.png')
guitar9.photos.attach(io: URI.open("#{base}nature2_qwibkz.png"), filename: 'nature2.png')
guitar9.save
puts "#{Guitar.count} guitars saved..."

guitar10 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Deluxe Roundback",
  caption: "Deluxe Roundback, Natural",
  description: "The Deluxe Roundback Electro Acoustic Guitar by Gear4music provides that classic '80s Acoustic Rock tone at a great price. The perfect blend of style and sound, the Deluxe Roundback projects a bright, articulate response thanks to its spruce top. The Electro Acoustic's ABS body makes it the ideal choice for gigging guitarists as it is able to withstand the inevitable bumps and knocks that come with continued use, all whilst being lightweight and feedback resistant.",
  guitar_type: "Electro-Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar10.photos.attach(io: URI.open("#{base}grain0_hl75jw.png"), filename: 'grain0.png')
guitar10.photos.attach(io: URI.open("#{base}grain1_rik711.png"), filename: 'grain1.png')
guitar10.photos.attach(io: URI.open("#{base}grain2_flzpbr.png"), filename: 'grain2.png')
guitar10.save
puts "#{Guitar.count} guitars saved..."

guitar11 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Gretsch G9500 Jim Dandy",
  caption: "Gretsch G9500 Jim Dandy Flat Top, 2-Color Sunburst",
  description: "The Gretsch G9500 Jim Dandy Flat Top Acoustic is a bright voiced parlour style guitar. Offering a bold resonance, comfortable playability, and a vintage inspired aesthetic, the G9500 will fuel your creativity. And that's because it's just so easy to pick up and play! The smaller size, coupled with a shorter 24 inch scale length, makes it an approachable instrument for any size - or level - of player.",
  guitar_type: "Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar11.photos.attach(io: URI.open("#{base}country0_snev0o.png"), filename: 'country0.png')
guitar11.photos.attach(io: URI.open("#{base}country1_lykc0k.png"), filename: 'country1.png')
guitar11.photos.attach(io: URI.open("#{base}country2_zebiuz.png"), filename: 'country2.png')
guitar11.save
puts "#{Guitar.count} guitars saved..."

guitar12 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Epiphone 1959 Les Paul",
  caption: "Epiphone 1959 Les Paul Standard Outfit, Aged Dark Cherry Burst",
  description: "Vintage style. Recreated for the modern player. The Epiphone 1959 Les Paul Standard Outfit delivers the tone you love with added performance. Made in partnership with the Gibson Custom Shop, you'll get enhanced playability from a mahogany body, hand-rolled neck, and era specific electronics.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar12.photos.attach(io: URI.open("#{base}sunny0_ohref5.png"), filename: 'sunny0.png')
guitar12.photos.attach(io: URI.open("#{base}sunny1_m9jac4.png"), filename: 'sunny1.png')
guitar12.photos.attach(io: URI.open("#{base}sunny2_asdews.png"), filename: 'sunny2.png')
guitar12.save
puts "#{Guitar.count} guitars saved..."

guitar13 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Fender Player Strat",
  caption: "Fender Player Stratocaster MN, Tidepool",
  description: "Fender Player Stratocaster MN is a guitar designed for serious musicians. Its look and feel are superbly streamlined, meaning it is a true pleasure to play and to hold. From the three Player Series Alnico 5 single coil pickups to the sleek maple neck and fretboard - everything is authentic. If you-re looking for a model which will give your riffs that classic Stratocaster shine and sparkle - this is it.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar13.photos.attach(io: URI.open("#{base}roy0_rwbnuk.png"), filename: 'roy0.png')
guitar13.photos.attach(io: URI.open("#{base}roy1_afyqev.png"), filename: 'roy1.png')
guitar13.photos.attach(io: URI.open("#{base}roy2_g85k6s.png"), filename: 'roy2.png')
guitar13.save
puts "#{Guitar.count} guitars saved..."

guitar14 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Squier Classic Vibe 60s",
  caption: "Squier Classic Vibe 60s Jazz Bass, Black",
  description: "The Classic Vibe 60's Jazz Bass combined the luxurious play-ability that made it famous, with the versatility and massive tone of its dual Fender-Designed alnico single-coil pickups. The Squier Classic Vibe 60s Jazz Bass is player-friendly and features a slim and comfortable 'C'-shaped neck profile with an easy-playing narrow-tall frets. This throwback Squier features a 1960s inspired headstock, nickel-plated hardware, a vintage-tinted gloss finish, and a black finish for stunningly vintage aesthetics.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar14.photos.attach(io: URI.open("#{base}bruno0_x1qbzf.png"), filename: 'bruno0.png')
guitar14.photos.attach(io: URI.open("#{base}bruno1_qzclfz.png"), filename: 'bruno1.png')
guitar14.photos.attach(io: URI.open("#{base}bruno2_tgvajv.png"), filename: 'bruno2.png')
guitar14.save
puts "#{Guitar.count} guitars saved..."

guitar15 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Gibson Thunderbird",
  caption: "Gibson Non-Reverse Thunderbird, Inverness Green",
  description: "The Gibson Non-Reverse Thunderbird s one of a kind, providing one of the most powerful bass experiences you can imagine. Whether you're looking to shake the walls with hard hitting basslines or fill the air with light melodies, this proud model will cover all areas. Coming with two legendary Gibson Thunderbird pickups in the neck and bridge, it has a wide tonal range which you can use to fill your music with colour.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar15.photos.attach(io: URI.open("#{base}sleek0_hkrvq7.png"), filename: 'sleek0.png')
guitar15.photos.attach(io: URI.open("#{base}sleek1_xjidxj.png"), filename: 'sleek1.png')
guitar15.photos.attach(io: URI.open("#{base}sleek2_g7ejag.png"), filename: 'sleek2.png')
guitar15.save
puts "#{Guitar.count} guitars saved..."

guitar16 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Yamaha SLG200S Steel String",
  caption: "Yamaha SLG200S Steel String Silent Guitar, Tobacco Brown",
  description: "The Yamaha SLG200S Steel String Silent Guitar delivers near-silent performance and incredibly natural acoustic tone. Having become a favourite amongst travelling musicians this guitar is an absolute must for life on the road. Whether you're writing a new masterpiece, practising your songs, or performing for the roadies the SLG200S has you covered.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar16.photos.attach(io: URI.open("#{base}modern0_wtbgay.png"), filename: 'modern0.png')
guitar16.photos.attach(io: URI.open("#{base}modern1_ta8mw8.png"), filename: 'modern1.png')
guitar16.photos.attach(io: URI.open("#{base}modern2_aojd9d.png"), filename: 'modern2.png')
guitar16.save
puts "#{Guitar.count} guitars saved..."

guitar17 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Taylor AD27e",
  caption: "Taylor AD27e American Dream",
  description: "The American dream. A notion that makes anything possible. And with the Taylor AD27e, Mahogany Top in your hands, achieving your musical goals just got easier. A solid Sapele back and sides matched with a mahogany top give both your low end and mid-range an earthy feel.",
  guitar_type: "Electo-Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar17.photos.attach(io: URI.open("#{base}taylor0_abzjet.png"), filename: 'taylor0.png')
guitar17.photos.attach(io: URI.open("#{base}taylor1_lnehhr.png"), filename: 'taylor1.png')
guitar17.photos.attach(io: URI.open("#{base}taylor2_mi2eim.png"), filename: 'taylor2.png')
guitar17.save
puts "#{Guitar.count} guitars saved..."

guitar18 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Hartwood Sonata-FX",
  caption: "Hartwood Sonata-FX Thinline, Sunburst",
  description: "The Hartwood Sonata-FX Thinline Electro-Acoustic Guitar offers a comprehensive all-in-one solution to practice, performance, and writing. Comprised of a premium selection of tonewoods, the Sonata-FX Thinline includes a solid sitka spruce top, flamed maple sides, as well as a maple neck, all of which complement one another, guaranteeing a full-frequency, responsive playing experience.",
  guitar_type: "Electro-Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar18.photos.attach(io: URI.open("#{base}nard0_okzaaz.png"), filename: 'nard0.png')
guitar18.photos.attach(io: URI.open("#{base}nard1_bltoou.png"), filename: 'nard1.png')
guitar18.photos.attach(io: URI.open("#{base}nard2_t2fpzb.png"), filename: 'nard2.png')
guitar18.save
puts "#{Guitar.count} guitars saved..."

guitar19 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Harlem V",
  caption: "Harlem V, Trans Black",
  description: "This Harlem V Bass Guitar by Gear4music has a classic black finish and is crafted in the familiar 'V' design. Designed with a lightweight Paulownia body, poplar laminate fingerboard and two humbucking bass pickups, this instruments provides huge sounds and high build quality.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar19.photos.attach(io: URI.open("#{base}rock0_x27itu.png"), filename: 'rock0.png')
guitar19.photos.attach(io: URI.open("#{base}rock1_q9zvgb.png"), filename: 'rock1.png')
guitar19.photos.attach(io: URI.open("#{base}rock2_esxw1y.png"), filename: 'rock2.png')
guitar19.save
puts "#{Guitar.count} guitars saved..."

guitar20 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Epiphone Viola",
  caption: "Epiphone Viola Bass, Vintage Sunburst ",
  description: "The Epiphone Viola Bass in Vintage Sunburst is a distinctive and unique bass in appearance and sound, reminiscent of the 60s British invasion. With a body crafted from maple and a laminated maple top, you’ll be able to access bright highs and tight lows. The neck is also constructed from maple, enhancing the tone with plenty of bite and twang; paired with a pau ferro fingerboard that brings out a softer side in the sound.",
  guitar_type: "Bass",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar20.photos.attach(io: URI.open("#{base}sixties0_hlschr.png"), filename: 'sixties0.png')
guitar20.photos.attach(io: URI.open("#{base}sixties1_emdrnt.png"), filename: 'sixties1.png')
guitar20.photos.attach(io: URI.open("#{base}sixties2_kxqtmb.png"), filename: 'sixties2.png')
guitar20.save
puts "#{Guitar.count} guitars saved..."

guitar21 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Epiphone LP 50s",
  caption: "Epiphone Les Paul Standard 50s, Metallic Gold",
  description: "You're about to have an epiphany. Actually, it's an Epiphone Les Paul Standard 50s, but it will show you the way to greatness. Having been inspired by the Gibson Les Paul, it offers the same feel and character of that iconic and revered guitar - but at a much more affordable price point. Featuring Probucker 1 and Probucker 2 humbuckers, this Epiphone delivers a deliciously authentic vintage tone - it will electrify any stage.",
  guitar_type: "Electric",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar21.photos.attach(io: URI.open("#{base}gold0_hjs3ih.png"), filename: 'gold0.png')
guitar21.photos.attach(io: URI.open("#{base}gold1_p4texx.png"), filename: 'gold1.png')
guitar21.photos.attach(io: URI.open("#{base}gold2_groobt.png"), filename: 'gold2.png')
guitar21.save
puts "#{Guitar.count} guitars saved..."

guitar22 = Guitar.new(
  user_id: User.all.sample.id,
  name: "Gretsch G2410TG Streamliner",
  caption: "Gretsch G2410TG Streamliner Hollow SC, Village Amber",
  description: "Looking for elegance, power, and an abundance of versatility? Meet the Gretsch G2410TG Streamliner Hollow SC. Just one glance at this magnificent instrument and it is sure to captivate you. But its wondrous tone will take you to a different world. Boasting a pair of Broad'Tron BT-2S pickups, this guitar projects a tone that has glorious, tight lows and sparkling highs. They are the ultimate pickups for memorable gigs.",
  guitar_type: "Semi-Acoustic",
  published: true,
  cost_per_day: (5..25).to_a.sample )
guitar22.photos.attach(io: URI.open("#{base}tan0_gdwhim.png"), filename: 'tan0.png')
guitar22.photos.attach(io: URI.open("#{base}tan1_xzquvp.png"), filename: 'tan1.png')
guitar22.photos.attach(io: URI.open("#{base}tan2_boryot.png"), filename: 'tan2.png')
guitar22.save
puts "#{Guitar.count} guitars saved..."

guitar23 = Guitar.new(
  user_id: User.last.id,
  name: "Squier Bullet Telecaster",
  caption: "Squier Bullet Telecaster, Brown Sunburst",
  description: "The Squier Bullet Telecaster is an outstanding and affordable axe with a historic pedigree. That sought-after Telecast twang comes courtesy of a pair of high quality, single-coil pickups. A three-way selector switch means you've always got the right sound for the song, while the maple neck's comfortable 'C' shape and smooth, satin finish make for slick chord changes in the blink of an eye.",
  guitar_type: "Electric",
  published: false,
  cost_per_day: (5..25).to_a.sample )
guitar23.photos.attach(io: URI.open("#{base}classic0_ggkqkl.png"), filename: 'classic0.png')
guitar23.photos.attach(io: URI.open("#{base}classic1_z9vgum.png"), filename: 'classic1.png')
guitar23.photos.attach(io: URI.open("#{base}classic2_v2shtj.png"), filename: 'classic2.png')
guitar23.save
puts "#{Guitar.count} guitars saved..."
puts "Guitars created!"

puts "Creating bookings..."
36.times do
  Booking.create!(
    guitar_id: Guitar.where.not(user_id: nil).sample.id,
    user_id: User.all.sample.id,
    start_date: Faker::Date.between(from: 2.days.ago, to: 2.days.from_now),
    end_date: Faker::Date.between(from: 2.days.from_now, to: 2.days.from_now + 10))
end
puts "Bookings created!"

puts "Creating reviews..."
# Users can only review a guitar once
50.times do
  Review.create!(guitar_id: Guitar.all.sample.id,
    # user_id: User.where.not(id: Review.pluck(:user_id)).sample&.id,
    user_id: User.all.sample.id,
    rating: rand(1..5),
    comment: Faker::Hipster.paragraph)
end
puts "Reviews created!"


puts "Finished!"
