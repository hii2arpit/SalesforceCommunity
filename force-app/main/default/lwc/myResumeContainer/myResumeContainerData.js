import SOCIAL from '@salesforce/resourceUrl/SOCIAL';
import arpit from '@salesforce/resourceUrl/Arpit';
export const Profile_Image = arpit

export const SOCIAL_LINKS=[
     {
        type: 'twitter',
        label: "twitter/hii2arpit",
        link: "https://twitter.com/hii2arpit",
        icon: SOCIAL+'/SOCIAL/twitter.svg'
     },
     {
        type: 'github',
        label: "github/hii2arpit",
        link: "https://github.com/hii2arpit",
        icon: SOCIAL+'/SOCIAL/github.svg'
     },
     {
        type: 'trailhead',
        label: "trailhead/hii2arpit",
        link: "https://trailblazer.me/id/ajain08",
        icon: SOCIAL+'/SOCIAL/trailhead.svg'
     },
     {
        type: 'linkedin',
        label: "linkedin/hi2arpit",
        link: "https://www.linkedin.com/in/hi2arpit",
        icon: SOCIAL+'/SOCIAL/linkedin.svg'
     }
]

export const USER_DETAILS={
     NAME: 'Arpit Jain',
     ROLE: 'Senior Salesforce Developer',
     EMAIL: 'arpit.jain.uh@gmail.com',
     PHONE: '+1-832-551-4124'
}

export const CAREER_SUMMARY={
   HEADING:"CARRER SUMMARY",
   DESCRIPTION:"Experienced in various projects to customizing salesforce applications to implement business logic. Worked on Process builder, Flows, Workflow, Apex classes, Triggers, Web services, Aura Component, LWC, Visualforce pages for multiple projects by following Salesforce best practices. Also, experienced in multiple tools like Dataloader, Workbench, Visual Studio Code, SoapUI, Postman, etc. From my previous projects apart from technical knowledge I have also learned how to deal with the challenging problems. I always try to break down the problem into small tasks and start working on them individually to accomplish the task.",
   KEY_POINTS:["More than 6 years of application development experience including 4 years as a Salesforce Developer/Administrator in Sales cloud, Service cloud Community cloud.",
   "Experience in Salesforce configuration, customization, data migration, testing, integration with third-party applications.",
   "Experience in participated project requirement gathering by attending meetings and interacting with business stakeholders"]
}

export const EXPERIENCE_DATA={
   HEADING: "Work Experience",
   EXPERIENCES: [
       {
           ROLE: "Senior Salesforce Developer",
           COMPANY_NAME: "Creative Systems and Consulting",
           DURATION: "July 2020 - Present",
        //    DESCRIPTION:
        //        "Your Job description goes hereiusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
           DESCRIPTION_POINTS: [
               "Participate in complete application life cycle from technical design, architecture, development, testing and deployment of high quality salesforce solutions using coding best practices.",
               "Identify and recommend creative solutions to build extensions to the out-of-the-box capabilities of the platform.",
               "Communicate and collaborate with other technical resources like architects, admins, configuration experts and stakeholders regarding status, risks and any technical issues.",
               "Implement multiple AppExchange tools like DocuSign, eSignLive and others.",
               "Develop salesforce to on-prem solution integrations using APIs and Web Services. Ability to use Mulesoft and other integration tools.",
               "Ability to work well with customers both individually as well as in a highly collaborative team.",
               "Engage in code reviews and ensure adherence to best practices.",
               "Provide mentoring and technical leadership to other team members.",
           ],
           TECHNOLOGIES_USED: {
               HEADING: 'Technologies used',
               LIST: [
                   "Apex",
                   "LWC",
                   "Aura Component",
                   "VisualForce Pages",
                   "Javascript",
                   "SOQL",
                   "SOOB (Flow, Process Builder, Wrokflows)",
                   "CSS",
               ]
           },
       },
       {
           ROLE: "Senior Salesforce Developer",
           COMPANY_NAME: "Variable Soft",
           DURATION: "Jan 2017 - Jun 2018",
        //    DESCRIPTION:
        //        "Your Job description goes here iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
           DESCRIPTION_POINTS: [
               "Worked on writing Apex Classes, Triggers, web service class (SOAP and REST) and Visual Force Pages using standard, Custom Controller and Extensions for several projects.",
               "Develop high quality and scalable applications with Visualforce and salesforce Lightening Components.",
               "Configuring and customizing integration of salesforce platform with third party applications.",
               "Worked on creation multiselecting picklist pages using Dynamic SOQL and DMLs.",
               "Created workflow rules to defined related tasks, time triggered tasks, email alerts and field updates to implement business logic.",
               "Worked on Omni-Channel to routing cases.",
               "Apply best practices in testing and deployment of customized solutions to production.",
               "Participated in project requirement gathering by attending meetings and interacting with business stakeholders.",
           ],
           TECHNOLOGIES_USED: {
               HEADING: 'Technologies used',
               LIST: [
                "Apex",
                "Aura Component",
                "VisualForce Pages",
                "SOQL",
                "CSS",
                "HTML5/CSS3",
               ]
           }
       },
       {
           ROLE: "Salesforce Developer",
           COMPANY_NAME: "Applikon IT Solutions, Pvt. Ltd.",
           DURATION: "Feb 2016 – Jan 2017",
        //    DESCRIPTION:
        //        "Your Job description goes hereiusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
           DESCRIPTION_POINTS: [
               "Worked on Salesforce CRM, configuration, development, and deployment.",
               "Worked on Organization Wide Defaults, Security controls, Validations, Custom permissions, Permission sets, Role, Profiles, Role Hierarchies, Reports, Dashboards, Sharing Rules and Manual Sharing to implement Record-based sharing.",
               "Worked with automated processes - Workflows, Approvals and Process Builder.",
               "Worked on Page layouts, Validation Rules, Search layouts, Relationship, and Lead conversion Process.",
           ],
           TECHNOLOGIES_USED: {
               HEADING: 'Technologies used',
               LIST: [
                "Apex",
                "VisualForce Pages",
                "SOQL",
                "CSS",
                "HTML5/CSS3",
               ]
           }
       },
       {
           ROLE: "Associate Software Engineer",
           COMPANY_NAME: "Adya Systems & Software, Pvt. Ltd.",
           DURATION: "Aug 2014 – Feb 2016",
        //    DESCRIPTION:
        //        "Your Job description goes hereiusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
           DESCRIPTION_POINTS: [
               "Performed Website testing, Android application testing, Firmware testing on No-OS/RTOS.",
               "Run sanity, regression, and ad-hoc testing.",
               "Troubleshooting and bug reporting.s",
               "Developed test cases and performed testing by executing the test cases.",
               "Created User Guides and User manual documents.",
           ],
           TECHNOLOGIES_USED: {
               HEADING: 'Technologies used',
               LIST: [
                   "HTML5",
                   "CSS3",
                   "Javascript",
                   "java",
                   "SQL",
               ]
           }
       },
       {
        ROLE: "Intern",
        COMPANY_NAME: "APEDA - Ministry of Commerce",
        DURATION: "Jun 2013 – Jul 2013",
     //    DESCRIPTION:
     //        "Your Job description goes hereiusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ",
        DESCRIPTION_POINTS: [
            "Developed an application for issuing of registration and membership certificate for the exporters of APEDA. ",
            "Attended the training programs on HTML, C# and MySQL.",
        ],
        TECHNOLOGIES_USED: {
            HEADING: 'Technologies used',
            LIST: [
                "HTML5",
                "CSS3",
                "Javascript",
                "C#",
                "SQL",
            ]
        }
    },
   ]
}

export const EDUCATION_DATA={
   ICON: SOCIAL + '/SOCIAL/education.svg',
   HEADING: "EDUCATION",
   LIST:[
       {
           NAME: "Master in Computer science",
           UNIVERSITY_NAME: "University of Houston - Clear Lake",
           DURATION: "2018 - 2020",
       },
       {
           NAME: "Bachelor in Computer Science",
           UNIVERSITY_NAME: "Rajasthan Technical University",
           DURATION: "2010 - 2014",
       }
   ]
}

export const AWARDS_DATA={
   ICON: SOCIAL + '/SOCIAL/awards.svg',
   HEADING: "AWARDS",
   LIST: [
       {
           NAME: "MVP",
           DESCRIPTION:"Got MVP Award three times within six months.",
       },
   ]
}

export const CERTIFICATION_DATA={
  ICON: SOCIAL + '/SOCIAL/certification.svg',
  HEADING: "CERTIFICATIONS",
  LIST: [
      {
          NAME: "Salesforce Administrator",
      },
      {
          NAME: "Salesforce Platform Dev 1",
      },
      {
          NAME: "Salesforce Platform App Builder",
      },
      {
         NAME: "Salesforce Platform Dev 2",
      },
      {
         NAME: "Salesforce JavaScript Dev 1",
      },
      {
         NAME: "Salesforce Service Cloud Consultant",
      },
      {
         NAME: "Salesforce Sharing and Visibility Designer",
      },
      {
         NAME: "Lean Six Sigma White Belt Certification",
      },
  ]
}

export const LANGUAGES_DATA={
  HEADING: "Languages",
  LIST: [
      {
          NAME: "English",
          LEVEL: "Professional",
      },
      {
          NAME: "Hindi",
          LEVEL: "Native",
      },
  ]
}

export const SKILLS_DATA ={
  HEADING: "SKILLS",
  SKILLS:[
      {
          HEADING: "FRONTEND",
          SKILLS_LIST: [
            { NAME: "Aura Component", LEVEL: "95" },
            { NAME: "Lighting Web Component)", LEVEL: "90" },
            { NAME: "JavaScript(ES5/ES6/ES7/ES8)", LEVEL: "85" },
            { NAME: "HTML5/CSS3/SASS/LESS", LEVEL: "90" },
          ],
      },
      {
          HEADING: "BACKEND",
          SKILLS_LIST: [
              { NAME: "Apex", LEVEL: "95" },
              { NAME: "Java", LEVEL: "85" },
          ],
      },
      {
          HEADING: "CRM",
          SKILLS_LIST: [
              { NAME: "Salesforce", LEVEL: "95" },
          ],
      }
  ],
  OTHERS_SKILLS:{
      HEADING: 'OTHERS',
      SKILLS_LIST: [
          "Git",
          "Code Review",
          "JIRA",
          "Unit Testing"] 
  }
}

export const INTERESTS_DATA = {
  HEADING: "Interests",
  LIST: ["Driving", "Cooking", "Swimming"]
}
