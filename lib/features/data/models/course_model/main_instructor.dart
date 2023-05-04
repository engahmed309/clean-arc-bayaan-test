class MainInstructor {
	num? id;
	String? name;
	String? photo;
	String? image;
	String? avatar;
	num? isActive;
	dynamic username;
	String? email;
	String? headline;
	num? phone;
	num? city;
	num? country;
	dynamic about;
	dynamic shortDetails;

	MainInstructor({
		this.id, 
		this.name, 
		this.photo, 
		this.image, 
		this.avatar, 
		this.isActive, 
		this.username, 
		this.email, 
		this.headline, 
		this.phone, 
		this.city, 
		this.country, 
		this.about, 
		this.shortDetails, 
	});

	factory MainInstructor.fromJson(Map<String, dynamic> json) {
		return MainInstructor(
			id: json['id'] as num?,
			name: json['name'] as String?,
			photo: json['photo'] as String?,
			image: json['image'] as String?,
			avatar: json['avatar'] as String?,
			isActive: json['is_active'] as num?,
			username: json['username'] as dynamic,
			email: json['email'] as String?,
			headline: json['headline'] as String?,
			phone: json['phone'] as num?,
			city: json['city'] as num?,
			country: json['country'] as num?,
			about: json['about'] as dynamic,
			shortDetails: json['short_details'] as dynamic,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'photo': photo,
				'image': image,
				'avatar': avatar,
				'is_active': isActive,
				'username': username,
				'email': email,
				'headline': headline,
				'phone': phone,
				'city': city,
				'country': country,
				'about': about,
				'short_details': shortDetails,
			};
}
