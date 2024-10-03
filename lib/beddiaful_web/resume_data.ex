defmodule BeddiafulWeb.ResumeData do
 def sections do
    [
      %{id: :current, title: "Currently", icon: "M13 10V3L4 14h7v7l9-11h-7z"},
      %{id: :summary, title: "Summary", icon: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"},
      %{id: :timeline, title: "Timeline", icon: "M13 10V3L4 14h7v7l9-11h-7z"},
      %{id: :experience, title: "Experience", icon: "M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"},
      %{id: :skills, title: "Skills", icon: "M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"},
      %{id: :education, title: "Education", icon: "M12 14l9-5-9-5-9 5 9 5z M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"},
      %{id: :projects, title: "Projects", icon: "M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"},
      %{id: :blog, title: "Blog", icon: "M6 5c7.18 0 13 5.82 13 13M6 11a7 7 0 017 7m-6 0a1 1 0 11-2 0 1 1 0 012 0z"}
    ]
  end

  def current_activities do
    [
      %{emoji: "📍", activity: "Currently in Michigan, so my son can spend quality time with his grandparents"},
      %{emoji: "📚", activity: "Reading \"Machine Learning in Elixir\" - trying to wrap my head around ML concepts in my favorite language!"},
      %{emoji: "💻", activity: "Grinding LeetCode - because who doesn't love a good coding puzzle?"},
      %{emoji: "🧪", activity: "Experimenting with Nx and Livebook for some personal projects - the future of Elixir looks exciting!"},
      %{emoji: "🎬", activity: "Tinkering with Elixir Membrane multimedia framework - exploring the world of media processing in Elixir!"}
    ]
  end

  def timeline_items do
    [
      %{
        company: "Blitz.gg",
        role: "Senior Fullstack Engineer",
        period: "July 2023 - September 2024",
        responsibilities: [
          "Implemented integrations for multiple popular games",
          "Developed features to collect and process hundreds of millions of data points",
          "Redesigned game data architecture by creating a comprehensive generic system"
        ]
      },
      %{
        company: "Discord",
        role: "Software Engineer",
        period: "October 2021 - May 2023",
        responsibilities: [
          "Maintained and improved core Elixir backend systems",
          "Worked on the \"unlimited server size\" initiative",
          "Developed Python scripts to automate the deployment process",
          "Utilized Terraform for Infrastructure as Code (IaC)"
        ]
      },
      %{
        company: "The RealReal",
        role: "Senior Software Engineer",
        period: "June 2019 - October 2021",
        responsibilities: [
          "Migrated bank account information of 500,000 consignors to Stripe",
          "Moved double-digit millions monthly payments to Stripe",
          "Implemented identity and business verification for KYC obligations"
        ]
      },
      %{
        company: "Fewlines",
        role: "Software Engineer",
        period: "October 2016 - June 2019",
        responsibilities: [
          "Built and maintained an authentication SaaS supporting OAuth 2 RFC 6749",
          "Implemented various login flows including social login"
        ]
      },
      %{
        company: "ThredUP",
        role: "Software Engineer",
        period: "September 2014 - October 2016",
        responsibilities: [
          "First engineer to migrate an application to React in 2014",
          "Created V2 of itemization, processing ~5000 items a week across 4 distribution centers",
          "Migrated applications from Backbone/CoffeeScript to React/Flux"
        ]
      }
    ]
  end

  def meta_tags do
    [
      %{attribute: "name", name: "description", content: "Senior Software Engineer with 10+ years of experience in backend systems and full-stack development. Expertise in Elixir, Phoenix, and OTP."},
      %{attribute: "name", name: "keywords", content: "Software Engineer, Elixir, Phoenix, OTP, Backend Systems, Full-stack Development"},
      %{attribute: "property", name: "og:title", content: "Mehdi Beddiaf - Software Engineer"},
      %{attribute: "property", name: "og:description", content: "Senior Software Engineer with expertise in Elixir, Phoenix, and OTP. View my professional experience and projects."},
      %{attribute: "property", name: "og:type", content: "website"},
      %{attribute: "property", name: "og:url", content: "https://beddiaful.dev"},
      %{attribute: "name", name: "twitter:card", content: "summary_large_image"},
      %{attribute: "name", name: "twitter:title", content: "Mehdi Beddiaf - Software Engineer"},
      %{attribute: "name", name: "twitter:description", content: "Senior Software Engineer with expertise in Elixir, Phoenix, and OTP. View my professional experience and projects."}
    ]
  end
end
