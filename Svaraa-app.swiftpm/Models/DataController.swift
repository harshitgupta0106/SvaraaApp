//
//  File.swift
//  Florie-app
//
//  Created by Harshit Gupta on 06/02/25.
//

import Foundation


//Creating Singleton class
@MainActor
class DataController: ObservableObject {
    private var user: User =
    User(
        name: UserDefaults.standard.string(forKey: "userName") ?? "User",
        age: UserDefaults.standard.integer(forKey: "userAge") == 0 ? Int.max : UserDefaults.standard.integer(forKey: "userAge")
    )
    
    private var qaDictionary: [String : String] = [:]
    private var pcodDetectQuestions: [String] = []
    private var pcosDetectQuestions: [String] = []
    
    private var stories: [Story] = []
    
    private var checkLists: [CheckList] = []
    
    static let shared = DataController()
    
    private init() {
        loadData()
        loadCheckLists()
        loadQAData()
//        print(qaDictionary)
    }
    //MARK: - Data filling
    
    func loadData() {
        stories = [
            Story(
                title: "Svaraa’s Big Day: A Story of Growing Up",
                storyScenes: [
                    StoryScene(
                        descriptions: [
                            "Today is a special day—Svaraa’s birthday! She’s turning 12, and everything feels magical.",
                            "Balloons fill the room, her friends are arriving, and she’s got the prettiest dress on.",
                            ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_VeryHappy"
                    ),
                    StoryScene(
                        descriptions: [
                            "But… something feels different today.",
                            "As she laughs with her best friend, Anaya, Svaraa suddenly feels a strange wetness in her underwear.",
                            "Confused, she rushes to the bathroom.",
                            "Her heart pounds as she looks down and sees something unexpected—a deep red stain on her favorite dress.",
                            "Her mind races. Is something wrong with me?",
                            "She remembers a health class where they mentioned something about periods.",
                            "But no one really talked about what it feels like to get one for the first time."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Shocked")
                ],
                mcqScene: MCQScene(
                        question: "What should Svaraa do next?",
                        options: [
                            "Panic and hide it from everyone.",
                            "Use tissue paper and hope it stops.",
                            "Find an elder she trusts and ask for help.",
                            "Ignore it and continue with the party."
                            ],
                        correctOptionIndex: 2,
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Question"

                ),
                finalScene: StoryScene(
                    descriptions: [
                        "Svaraa hesitates, then calls her mom. \"Mom, I think I started my period.\"\n\nHer mom smiles warmly. \"That's wonderful! You’re growing up.\"\n\nShe gives Svaraa a pad. \"This will keep you comfortable. Let’s go over how to use it.\""
                    ],
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Satisfied"
                )
            ),
            Story(
                title: "Svaraa’s Silent Struggle: A Lesson on UTIs",
                storyScenes: [
                    StoryScene(
                        descriptions: [
                            "Svaraa had settled into hostel life—early morning lectures, late-night study sessions, and endless cups of chai. ",
                            "She was so busy that she barely noticed small changes in her body.",
                            "One evening, after rushing back from the library, she felt a burning sensation while urinating.",
                            "\"Maybe I didn’t drink enough water,\" she thought and ignored it."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Happy"
                    ),StoryScene(
                        descriptions: [
                            "One evening, after rushing back from the library, she felt a burning sensation while urinating.",
                            "\"Maybe I didn’t drink enough water,\" she thought and ignored it.",
                            "Days passed, and the discomfort increased. She felt the urge to pee frequently, but only a few drops would come out—each time with a painful sting."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Confused"
                    ),
                    StoryScene(
                        descriptions: [
                            "Then, one night, she saw something alarming—a slight trace of blood in her urine."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Crying"
                    )
                ],
                mcqScene: MCQScene(
                    question: "What should Svaraa do now?",
                    options: [
                        "Drink more water and wait for it to go away.",
                        "Ignore it—it’s probably nothing serious.",
                        "Ask a senior or warden for help.",
                        "Take random medicine from a friend."
                    ],
                    correctOptionIndex: 2,
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Question"
                ),
                finalScene: StoryScene(
                    descriptions: [
                        "Ignoring UTI symptoms can lead to kidney infections. Drinking water helps, but only a doctor can provide the right treatment. \n\nSeeking help from trusted elders or a healthcare professional, early prevents complications!"
                    ],
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Smiling"
                )
            ),
            
            Story(
                title: "The Hidden Itch: Svaraa’s Yeast Infection Story",
                storyScenes: [
                    StoryScene(
                        descriptions: [
                            "Life in the hostel was thrilling but hectic.",
                            "Between gym sessions, classes, and laundry delays, Svaraa often wore damp clothes or stayed in sweaty leggings for hours."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Happy"
                    ),StoryScene(
                        descriptions: [
                            "One morning, she felt a persistent itch down there.",
                            "She ignored it, assuming it would go away."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Confused"
                    ),StoryScene(
                        descriptions: [
                            "A few days later, the itching worsened, and she noticed thick, white discharge.",
                            "Sitting in lectures became unbearable.",
                            "She tried washing the area with strong soap, but that only made things worse."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Crying"
                    )
                ],
                mcqScene: MCQScene(
                    question: "What should Svaraa do?",
                    options: [
                        "Ignore it—it will go away.",
                        "Use strong soap to clean the area.",
                        "Try home remedies without consulting anyone.",
                        "Speak to a senior or visit a doctor."
                    ],
                    correctOptionIndex: 3,
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Curious"
                ),
                finalScene: StoryScene(
                    descriptions: [
                        "Harsh soaps disrupt the body’s natural balance, making the infection worse. \n\nWearing clean, dry clothes and seeking medical advice is the safest option."
                    ],
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Smiling"
                )
            ),
            
            Story(
                title: "Svaraa’s Mystery: When Periods Don’t Follow the Rules",
                storyScenes: [
                    StoryScene(
                        descriptions: [
                            "Svaraa always thought her period would settle into a routine, like everyone said it would."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Happy"
                    ),StoryScene(
                        descriptions: [
                            "But at 16, things weren’t adding up."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Casual"
                    ),StoryScene(
                        descriptions: [
                            "Some months, her period came with unbearable cramps.",
                            "Other times, it simply didn’t show up at all.",
                            "When it did, it lasted for weeks, leaving her exhausted.",
                            "She stared at the calendar app on her phone—her last period was over two months ago.",
                            "\"Maybe stress is messing it up,\" she told herself.",
                            "But deep down, she felt uneasy."
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Dissatified"
                    ),
                    StoryScene(
                        descriptions: [
                            "Then came the sudden weight gain, the stubborn acne, and the tiny dark hairs on her chin.",
                            "No matter what she did, nothing seemed to change.",
                            "One afternoon, as she tied her hair into a ponytail, she noticed something—her hairline looked thinner.",
                            "Her stomach dropped. What was happening to her?"
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Shocked"
                    ),
                    StoryScene(
                        descriptions: [
                            "She turned to her best friend, Anaya. \"My period’s been all over the place. And now my hair…\"",
                            "Anaya frowned. \"That doesn’t sound normal.\""
                        ],
                        backgroundImageName: "",
                        svaraaImageName: "Svaraa_Crying"
                    )
                ],
                mcqScene: MCQScene(
                    question: "What should Svaraa do next?",
                    options: [
                        "Ignore it and wait for things to fix themselves.",
                        "Try random weight loss diets and acne creams.",
                        "Compare herself to others and feel discouraged",
                        "Research her symptoms, talk to a doctor, and seek proper diagnosis."
                    ],
                    correctOptionIndex: 3,
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Curious"
                ),
                finalScene: StoryScene(
                    descriptions: [
                        "Svaraa’s symptoms weren’t random—they were all connected. A visit to the doctor confirmed it: Polycystic Ovary Syndrome (PCOS). \n\nPCOS isn’t just about irregular periods. It can affect weight, skin, hair, and even mood. But with the right guidance, lifestyle changes, and sometimes medication, it can be managed.\n\nWhen Svaraa finally got the right support, things got better."
                    ],
                    backgroundImageName: "",
                    svaraaImageName: "Svaraa_Smiling"
                )
            )

        ]
        
        pcodDetectQuestions = [
            "\nWhat is your height in meters?",
            "What is your weight in kg?",
            "What is the length of your menstrual cycle?",
            "Do you have unsual bleeding? (yes/no)"
        ]
        
        pcosDetectQuestions = [
            "\nDo you feel that your menstrual cycle is Irregular? (Yes/No)",
            "What is your weight in kg?",
            "What is your height in meters?",
            "Do you experience excessive hair growth on your face or body? (Yes/No)",
            "On a scale of 0 - 3, how severe is your acne? \n(0 - None, 1 - Mild, 2 - Moderate, 3 - Severe)",
            "Do you experience hair thinning or hair loss? (Yes/No)",
            "Do you have sudden weight gain or difficulty losing weight? (Yes/No)",
            "On a scale of 1 - 3, How would you describe your stress level? \n(1 - Low, 2 - Moderate, 3 - High)",
            "How many hours of sleep do you get per night?"
        ]
        
        checkLists = [
            CheckList(
                
                name: "PCOS",
                description: "Small, consistent habits create lasting change. \n\nThis daily checklist is designed to support hormonal balance, reduce inflammation, and boost metabolism—key factors in managing PCOS & PCOD. \n\nWith mindful nutrition, movement, and recovery, you can take control of your well-being, one check at a time. ",
                
                morningList: [
                    CheckListItem(name: "Drink warm lemon water / fenugreek seed water", isChecked: false),
                    CheckListItem(name: "Eat 5 soaked almonds + 2 walnuts + 1 tsp flaxseeds", isChecked: false),
                    CheckListItem(name: "Have a high-protein breakfast (Besan chilla / Sprouts / Ragi dosa / Eggs & toast / Paneer bhurji)", isChecked: false),
                    CheckListItem(name: "10 mins meditation or deep breathing", isChecked: false),
                    CheckListItem(name: "15–30 mins light exercise (walk, Surya Namaskar)", isChecked: false)
                ],
                
                afternoonList: [
                    CheckListItem(name: "Drink 1 glass coconut water / buttermilk", isChecked: false),
                    CheckListItem(name: "Eat 1 fruit (Guava, Papaya, Apple, Pomegranate, Berries)", isChecked: false),
                    CheckListItem(name: "Eat a balanced lunch (Dal + Millet/Brown Rice + Sabzi + Curd)", isChecked: false),
                    CheckListItem(name: "Take a 10-minute post-lunch walk", isChecked: false)
                ],
                
                eveningList: [
                    CheckListItem(name: "Eat a healthy snack (Roasted chana / Makhana / Peanut butter toast / Nuts & seeds)", isChecked: false),
                    CheckListItem(name: "30–45 mins of exercise (Yoga, Strength Training, Dance, Brisk Walk)", isChecked: false),
                    CheckListItem(name: "Drink 1 cup herbal tea (Spearmint, Cinnamon, Ginger-Turmeric)", isChecked: false)
                ],
                
                nightList: [
                    CheckListItem(name: "Eat a light dinner (Moong dal khichdi + Ghee / Soup + Sautéed Veggies / 1 Roti + Sabzi + Paneer/Tofu)", isChecked: false),
                    CheckListItem(name: "Drink 1 glass warm turmeric milk (Haldi + Almond milk)", isChecked: false),
                    CheckListItem(name: "5 mins deep breathing / gratitude journaling", isChecked: false),
                    CheckListItem(name: "Sleep for 7–9 hours", isChecked: false)
                ],
                
                commonList: [
                    CheckListItem(name: "Drink 2–3 liters of water", isChecked: false),
                    CheckListItem(name: "Take 5 deep breaths before meals", isChecked: false),
                    CheckListItem(name: "Avoid screens 30 mins before bed", isChecked: false)
                ]
            )
        ]
    }
    
    func loadQAData() {
        let fileName = "menstrual_awareness"
            guard let path = Bundle.main.path(forResource: fileName, ofType: "csv") else {
                print("File not found: \(fileName).csv")
                return
            }
            do {
                let content = try String(contentsOfFile: path)
                let lines = content.components(separatedBy: "\n")

                var tempDict: [String: String] = [:]
                for line in lines.dropFirst() { // Drop header row
                    let components = line.components(separatedBy: ",")
                    if components.count >= 2 {
                        let question = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
                        let answer = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
                        tempDict[question] = answer
                    }
                }

                self.qaDictionary = tempDict
                print("QA Data Loaded Successfully")

            } catch {
                print("Error loading file: \(error)")
            }
        }
      
    //MARK: - Svaraa's Life functions
    
    func getAllStories() -> [Story] {
        stories
    }
    
    func getNumberOfStories() -> Int {
        stories.count
    }
    
    func getStory(at index: Int) -> Story {
        stories[index]
    }
    
    func getAllStoryScenes(ofStoryIndex index: Int) -> [StoryScene] {
        stories[index].storyScenes
    }
    
    func getNumberOfStoryScenes(ofStoryIndex index: Int) -> Int {
        stories[index].storyScenes.count
    }
    
    func getStoryScene(ofStoryIndex index: Int, sceneIndex: Int) -> StoryScene {
        stories[index].storyScenes[sceneIndex]
    }
    
    func getFinalScene(ofStoryIndex index: Int) -> StoryScene {
        stories[index].finalScene
    }
    
    func getTitleOfStory(ofStoryIndex index: Int) -> String {
        stories[index].title
    }
    
    func getAllTitlesOfStories() -> [String] {
        stories.map { $0.title }
    }
    
    func getMCQScene(ofStoryIndex index: Int) -> MCQScene {
        stories[index].mcqScene
    }
    
    func getNumberOfDescriptionsInScene(ofStoryIndex index: Int, sceneIndex: Int) -> Int {
        stories[index].storyScenes[sceneIndex].descriptions.count
    }
    
    //MARK: - Svaraa's Talk functions
    func getAllPCODQuestions() -> [String] {
        pcodDetectQuestions
    }
    
    func getAllPCOSQuestions() -> [String] {
        pcosDetectQuestions
    }
    
    func getQADictionary() -> [String: String] {
        qaDictionary
    }
    
    //MARK: - Svaraa's Logs functions
    
    func getPCOSCheckList() -> CheckList? {
        checkLists.filter { $0.name == "PCOS" }.first
    }
    
    func toggleCheckItem(checkListIndex: Int, category: ChecklistCategory, itemIndex: Int) {
        guard checkListIndex < checkLists.count else { return }

        switch category {
        case .morning:
            guard itemIndex < checkLists[checkListIndex].morningList.count else { return }
            checkLists[checkListIndex].morningList[itemIndex].isChecked.toggle()
        case .afternoon:
            guard itemIndex < checkLists[checkListIndex].afternoonList.count else { return }
            checkLists[checkListIndex].afternoonList[itemIndex].isChecked.toggle()
        case .evening:
            guard itemIndex < checkLists[checkListIndex].eveningList.count else { return }
            checkLists[checkListIndex].eveningList[itemIndex].isChecked.toggle()
        case .night:
            guard itemIndex < checkLists[checkListIndex].nightList.count else { return }
            checkLists[checkListIndex].nightList[itemIndex].isChecked.toggle()
        case .common:
            guard itemIndex < checkLists[checkListIndex].commonList.count else { return }
            checkLists[checkListIndex].commonList[itemIndex].isChecked.toggle()
        }

        saveCheckLists() // Save the state after toggling
    }
    
    func saveCheckLists() {
        if let encodedData = try? JSONEncoder().encode(checkLists) {
            UserDefaults.standard.set(encodedData, forKey: "savedCheckLists")
        }
    }


    func loadCheckLists() {
        if let savedData = UserDefaults.standard.data(forKey: "savedCheckLists"),
           let decodedCheckLists = try? JSONDecoder().decode([CheckList].self, from: savedData) {
            checkLists = decodedCheckLists
        }
    }


    func getCheckLists() -> [CheckList] {
        return checkLists
    }

    
    
    
    
    //MARK: - User functions
    func getUserName() -> String {
        user.name
    }
    
    func setUserName(name: String) {
        user.name = name
        UserDefaults.standard.set(name, forKey: "userName")
    }
    
    func getUserAge() -> Int {
        user.age
    }
    
    func setUserAge(age: Int) {
        user.age = age
        UserDefaults.standard.set(age, forKey: "userAge")
    }
}
