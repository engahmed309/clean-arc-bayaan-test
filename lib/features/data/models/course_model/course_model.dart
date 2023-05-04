import '../../../domain/entities/course_entity.dart';
import 'main_instructor.dart';

class CourseModel extends CourseEntity{
	num? id;
	String? title;
	String? slug;
	String? duration;
	String? image;
	String? thumbnail;
	num? price;
	num? discountPrice;
	num? publish;
	num? status;
	num? level;
	dynamic trailerLink;
	dynamic host;
	dynamic metaKeywords;
	dynamic metaDescription;
	num? totalEnrolled;
	num? totalRating;
	String? startDate;
	String? endDate;
	num? numberOfLessons;
	num? numberOfQuizzes;
	String? numberOfHours;
	MainInstructor? mainInstructor;
	DateTime? createdAt;
	DateTime? updatedAt;
	bool? isEnrolled;
	bool? bookmarks;
	bool? carts;

	CourseModel({
		this.id, 
		this.title, 
		this.slug, 
		this.duration, 
		this.image, 
		this.thumbnail, 
		this.price, 
		this.discountPrice, 
		this.publish, 
		this.status, 
		this.level, 
		this.trailerLink, 
		this.host, 
		this.metaKeywords, 
		this.metaDescription, 
		this.totalEnrolled, 
		this.totalRating, 
		this.startDate, 
		this.endDate, 
		this.numberOfLessons, 
		this.numberOfQuizzes, 
		this.numberOfHours, 
		this.mainInstructor, 
		this.createdAt, 
		this.updatedAt, 
		this.isEnrolled, 
		this.bookmarks, 
		this.carts, 
	}) : super(id: id!, image:image!, price: price!, title: title!);

	factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
				id: json['id'] as num?,
				title: json['title'] as String?,
				slug: json['slug'] as String?,
				duration: json['duration'] as String?,
				image: json['image'] as String?,
				thumbnail: json['thumbnail'] as String?,
				price: json['price'] as num?,
				discountPrice: json['discount_price'] as num?,
				publish: json['publish'] as num?,
				status: json['status'] as num?,
				level: json['level'] as num?,
				trailerLink: json['trailer_link'] as dynamic,
				host: json['host'] as dynamic,
				metaKeywords: json['meta_keywords'] as dynamic,
				metaDescription: json['meta_description'] as dynamic,
				totalEnrolled: json['total_enrolled'] as num?,
				totalRating: json['total_rating'] as num?,
				startDate: json['start_date'] as String?,
				endDate: json['end_date'] as String?,
				numberOfLessons: json['number_of_lessons'] as num?,
				numberOfQuizzes: json['number_of_quizzes'] as num?,
				numberOfHours: json['number_of_hours'] as String?,
				mainInstructor: json['main_instructor'] == null
						? null
						: MainInstructor.fromJson(json['main_instructor'] as Map<String, dynamic>),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				isEnrolled: json['is_enrolled'] as bool?,
				bookmarks: json['bookmarks'] as bool?,
				carts: json['carts'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'title': title,
				'slug': slug,
				'duration': duration,
				'image': image,
				'thumbnail': thumbnail,
				'price': price,
				'discount_price': discountPrice,
				'publish': publish,
				'status': status,
				'level': level,
				'trailer_link': trailerLink,
				'host': host,
				'meta_keywords': metaKeywords,
				'meta_description': metaDescription,
				'total_enrolled': totalEnrolled,
				'total_rating': totalRating,
				'start_date': startDate,
				'end_date': endDate,
				'number_of_lessons': numberOfLessons,
				'number_of_quizzes': numberOfQuizzes,
				'number_of_hours': numberOfHours,
				'main_instructor': mainInstructor?.toJson(),
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'is_enrolled': isEnrolled,
				'bookmarks': bookmarks,
				'carts': carts,
			};
}
