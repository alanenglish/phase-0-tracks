application = {
  name: "Alan English",
  address: "1009 W Webster Ave",
  email: "alan@english.com",
  phone: "(513) 238-3432",
  shade: "Carolina Blue",
  wallpaper: "Chevron",
  ombre: "So last season"
}

p application

application[:shade] = "Sky Blue"
application[:wallpaper] = "Abstract woodsy scenes"
application[:hired] = "Yes"


p application.fetch(:address)
p application.assoc(:ombre)

application.delete(:hired)
p application
