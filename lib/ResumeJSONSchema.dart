/*
 * Copyright © 2020 Akarsh Seggemu. All rights reserved.
 */

// To parse this JSON data, do
//
//     final resumeJsonSchema = resumeJsonSchemaFromJson(jsonString);

import 'dart:convert';

ResumeJsonSchema resumeJsonSchemaFromJson(String str) => ResumeJsonSchema.fromJson(json.decode(str));

String resumeJsonSchemaToJson(ResumeJsonSchema data) => json.encode(data.toJson());

class ResumeJsonSchema {
  Basics basics;
  List<Volunteer> work;
  List<Volunteer> volunteer;
  List<Education> education;
  List<Award> awards;
  List<Publication> publications;
  List<Skill> skills;
  List<Language> languages;
  List<Interest> interests;
  List<Reference> references;

  ResumeJsonSchema({
    this.basics,
    this.work,
    this.volunteer,
    this.education,
    this.awards,
    this.publications,
    this.skills,
    this.languages,
    this.interests,
    this.references,
  });

  factory ResumeJsonSchema.fromJson(Map<String, dynamic> json) => ResumeJsonSchema(
    basics: Basics.fromJson(json["basics"]),
    work: List<Volunteer>.from(json["work"].map((x) => Volunteer.fromJson(x))),
    volunteer: List<Volunteer>.from(json["volunteer"].map((x) => Volunteer.fromJson(x))),
    education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
    awards: List<Award>.from(json["awards"].map((x) => Award.fromJson(x))),
    publications: List<Publication>.from(json["publications"].map((x) => Publication.fromJson(x))),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromJson(x))),
    references: List<Reference>.from(json["references"].map((x) => Reference.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "basics": basics.toJson(),
    "work": List<dynamic>.from(work.map((x) => x.toJson())),
    "volunteer": List<dynamic>.from(volunteer.map((x) => x.toJson())),
    "education": List<dynamic>.from(education.map((x) => x.toJson())),
    "awards": List<dynamic>.from(awards.map((x) => x.toJson())),
    "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
    "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
    "references": List<dynamic>.from(references.map((x) => x.toJson())),
  };
}

class Award {
  String title;
  DateTime date;
  String awarder;
  String summary;

  Award({
    this.title,
    this.date,
    this.awarder,
    this.summary,
  });

  factory Award.fromJson(Map<String, dynamic> json) => Award(
    title: json["title"],
    date: DateTime.parse(json["date"]),
    awarder: json["awarder"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "awarder": awarder,
    "summary": summary,
  };
}

class Basics {
  String name;
  String label;
  String picture;
  String email;
  String phone;
  String website;
  String summary;
  Location location;
  List<Profile> profiles;
  Info info;

  Basics({
    this.name,
    this.label,
    this.picture,
    this.email,
    this.phone,
    this.website,
    this.summary,
    this.location,
    this.profiles,
    this.info,
  });

  factory Basics.fromJson(Map<String, dynamic> json) => Basics(
    name: json["name"],
    label: json["label"],
    picture: json["picture"],
    email: json["email"],
    phone: json["phone"],
    website: json["website"],
    summary: json["summary"],
    location: Location.fromJson(json["location"]),
    profiles: List<Profile>.from(json["profiles"].map((x) => Profile.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "label": label,
    "picture": picture,
    "email": email,
    "phone": phone,
    "website": website,
    "summary": summary,
    "location": location.toJson(),
    "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}

class Info {
  String nationality;
  String workPermit;
  DateTime dateOfBirth;
  String placeOfBirth;

  Info({
    this.nationality,
    this.workPermit,
    this.dateOfBirth,
    this.placeOfBirth,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    nationality: json["nationality"],
    workPermit: json["workPermit"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    placeOfBirth: json["placeOfBirth"],
  );

  Map<String, dynamic> toJson() => {
    "nationality": nationality,
    "workPermit": workPermit,
    "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "placeOfBirth": placeOfBirth,
  };
}

class Location {
  String address;
  String postalCode;
  String city;
  String countryCode;
  String region;

  Location({
    this.address,
    this.postalCode,
    this.city,
    this.countryCode,
    this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    postalCode: json["postalCode"],
    city: json["city"],
    countryCode: json["countryCode"],
    region: json["region"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "postalCode": postalCode,
    "city": city,
    "countryCode": countryCode,
    "region": region,
  };
}

class Profile {
  String network;
  String username;
  String url;

  Profile({
    this.network,
    this.username,
    this.url,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    network: json["network"],
    username: json["username"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "network": network,
    "username": username,
    "url": url,
  };
}

class Education {
  String institution;
  String area;
  String studyType;
  DateTime startDate;
  DateTime endDate;
  String gpa;
  List<dynamic> courses;

  Education({
    this.institution,
    this.area,
    this.studyType,
    this.startDate,
    this.endDate,
    this.gpa,
    this.courses,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    institution: json["institution"],
    area: json["area"],
    studyType: json["studyType"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    gpa: json["gpa"],
    courses: List<dynamic>.from(json["courses"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "institution": institution,
    "area": area,
    "studyType": studyType,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "gpa": gpa,
    "courses": List<dynamic>.from(courses.map((x) => x)),
  };
}

class Interest {
  String name;
  List<String> keywords;

  Interest({
    this.name,
    this.keywords,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    name: json["name"],
    keywords: List<String>.from(json["keywords"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "keywords": List<dynamic>.from(keywords.map((x) => x)),
  };
}

class Language {
  String language;
  String fluency;

  Language({
    this.language,
    this.fluency,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    language: json["language"],
    fluency: json["fluency"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "fluency": fluency,
  };
}

class Publication {
  String name;
  String publisher;
  DateTime releaseDate;
  String website;
  String summary;

  Publication({
    this.name,
    this.publisher,
    this.releaseDate,
    this.website,
    this.summary,
  });

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
    name: json["name"],
    publisher: json["publisher"],
    releaseDate: DateTime.parse(json["releaseDate"]),
    website: json["website"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "publisher": publisher,
    "releaseDate": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "website": website,
    "summary": summary,
  };
}

class Reference {
  String name;
  String reference;

  Reference({
    this.name,
    this.reference,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => Reference(
    name: json["name"],
    reference: json["reference"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "reference": reference,
  };
}

class Skill {
  String name;
  String level;
  List<String> keywords;

  Skill({
    this.name,
    this.level,
    this.keywords,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    name: json["name"],
    level: json["level"],
    keywords: List<String>.from(json["keywords"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "level": level,
    "keywords": List<dynamic>.from(keywords.map((x) => x)),
  };
}

class Volunteer {
  String organization;
  String position;
  String website;
  DateTime startDate;
  String endDate;
  String summary;
  List<String> highlights;
  String company;

  Volunteer({
    this.organization,
    this.position,
    this.website,
    this.startDate,
    this.endDate,
    this.summary,
    this.highlights,
    this.company,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) => Volunteer(
    organization: json["organization"] == null ? null : json["organization"],
    position: json["position"],
    website: json["website"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: json["endDate"],
    summary: json["summary"],
    highlights: List<String>.from(json["highlights"].map((x) => x)),
    company: json["company"] == null ? null : json["company"],
  );

  Map<String, dynamic> toJson() => {
    "organization": organization == null ? null : organization,
    "position": position,
    "website": website,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "endDate": endDate,
    "summary": summary,
    "highlights": List<dynamic>.from(highlights.map((x) => x)),
    "company": company == null ? null : company,
  };
}
