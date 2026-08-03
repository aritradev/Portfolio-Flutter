class Skill {
  final String name;
  final String category; // e.g. "Language", "Framework", "Tool"

  const Skill({required this.name, required this.category});
}

const List<Skill> skillList = [
  Skill(name: 'C++', category: 'Language'),
  Skill(name: 'Python', category: 'Language'),
  Skill(name: 'Dart', category: 'Language'),
  Skill(name: 'JavaScript', category: 'Language'),
  Skill(name: 'React / Next.js', category: 'Framework'),
  Skill(name: 'Flutter', category: 'Framework'),
  Skill(name: 'Node.js', category: 'Framework'),
  Skill(name: '.NET', category: 'Framework'),
  Skill(name: 'YOLOv11-seg', category: 'ML/CV'),
  Skill(name: 'OpenCV', category: 'ML/CV'),
  Skill(name: 'Git & GitHub', category: 'Tool'),
  Skill(name: 'Competitive Programming', category: 'Tool'),
];
