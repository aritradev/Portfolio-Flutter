class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? liveUrl;
  final String? repoUrl;

  const Project({
    required this.title,
    required this.description,
    required this.tags,
    this.liveUrl,
    this.repoUrl,
  });
}

const List<Project> projectList = [
  Project(
    title: 'freereceipt.dev',
    description:
        'A browser-based, no-login invoice & receipt generator. Built for speed and privacy — '
        'nothing ever touches a server. Promoted across Reddit, LinkedIn, and Hacker News.',
    tags: ['React', 'Next.js', 'Web App'],
    liveUrl: 'https://freereceipt.dev',
  ),
  Project(
    title: 'Smart Prescription Decoder',
    description:
        'A tool that reads and decodes handwritten medical prescriptions, turning illegible '
        'doctor handwriting into clear, structured text.',
    tags: ['Web App', 'OCR', 'AI'],
    liveUrl: 'https://smart-prescription-decoder-five.vercel.app/',
  ),
  Project(
    title: 'CPU Scheduling Simulator',
    description:
        'An OS Lab project simulating FCFS, SJF, SRTF, and Round Robin scheduling algorithms '
        'with visual timelines, built with a small team ("Gremlin Storm").',
    tags: ['JavaScript', 'OS Concepts', 'Simulation'],
  ),
];
