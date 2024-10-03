defmodule BeddiafulWeb.ResumeLive do
  use BeddiafulWeb, :live_view

  def mount(_params, _session, socket) do
    sections = [
      %{id: :summary, title: "Summary", icon: "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"},
      %{id: :timeline, title: "Timeline", icon: "M13 10V3L4 14h7v7l9-11h-7z"},
      %{id: :experience, title: "Experience", icon: "M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"},
      %{id: :skills, title: "Skills", icon: "M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"},
      %{id: :education, title: "Education", icon: "M12 14l9-5-9-5-9 5 9 5z M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"},
      %{id: :projects, title: "Projects", icon: "M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z"}
    ]
    
    timeline_items = [
      %{company: "Blitz.gg", role: "Senior Fullstack Engineer", period: "July 2023 - September 2024", responsibilities: ["Implemented integrations for multiple popular games", "Developed features to collect and process hundreds of millions of data points", "Redesigned game data architecture by creating a comprehensive generic system"]},
      %{company: "Discord", role: "Software Engineer", period: "October 2021 - May 2023", responsibilities: ["Maintained and improved core Elixir backend systems", "Worked on the \"unlimited server size\" initiative", "Developed Python scripts to automate the deployment process", "Utilized Terraform for Infrastructure as Code (IaC)"]},
      %{company: "The RealReal", role: "Senior Software Engineer", period: "June 2019 - October 2021", responsibilities: ["Migrated bank account information of 500,000 consignors to Stripe", "Moved double-digit millions monthly payments to Stripe", "Implemented identity and business verification for KYC obligations"]},
      %{company: "Fewlines", role: "Software Engineer", period: "October 2016 - June 2019", responsibilities: ["Built and maintained an authentication SaaS supporting OAuth 2 RFC 6749", "Implemented various login flows including social login"]},
      %{company: "ThredUP", role: "Software Engineer", period: "September 2014 - October 2016", responsibilities: ["First engineer to migrate an application to React in 2014", "Created V2 of itemization, processing ~5000 items a week across 4 distribution centers", "Migrated applications from Backbone/CoffeeScript to React/Flux"]}
    ]
    
    {:ok, assign(socket, sections: sections, active_section: :summary, timeline_items: timeline_items)}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-gray-900 text-gray-100 py-12 px-4 sm:px-6 lg:px-8">
      <div class="max-w-7xl mx-auto">
        <div class="text-center mb-12">
          <h1 class="text-4xl font-extrabold text-white sm:text-5xl sm:tracking-tight lg:text-6xl">Mehdi Beddiaf</h1>
          <p class="mt-5 text-xl text-gray-400">Software Engineer</p>
          <div class="mt-3 text-gray-400">
            <p>Los Angeles, CA | 415-882-6758 | mehdi.beddiaf@gmail.com</p>
            <p>LinkedIn: /in/mehdibeddiaf | Website: mehdib.dev</p>
          </div>
        </div>
        <div class="mt-12 grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-6">
          <%= for section <- @sections do %>
            <.section_button section={section} active_section={@active_section} />
          <% end %>
        </div>
        <div class="mt-12 bg-gray-800 rounded-lg shadow-xl overflow-hidden">
          <div class="p-8">
            <%= case @active_section do %>
              <% :timeline -> %>
                <h2 class="text-3xl font-bold text-white mb-6">Career Timeline</h2>
                <.live_component module={BeddiafulWeb.TimelineLive} id="timeline" timeline_items={@timeline_items} />
              <% _ -> %>
                <.section_content section={Enum.find(@sections, &(&1.id == @active_section))} />
            <% end %>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def section_button(assigns) do
    ~H"""
    <button
      class={"flex items-center justify-center p-4 rounded-lg text-left transition-all duration-200 ease-in-out #{if @active_section == @section.id, do: "bg-blue-600 text-white", else: "bg-gray-800 text-gray-300 hover:bg-gray-700"}"}
      phx-click="select_section"
      phx-value-id={@section.id}
    >
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d={@section.icon} />
      </svg>
      <span class="text-lg font-medium"><%= @section.title %></span>
    </button>
    """
  end

  def section_content(assigns) do
    ~H"""
    <div class="prose prose-invert max-w-none">
      <%= case @section.id do %>
        <% :summary -> %>
          <p class="text-xl text-gray-300">
            Senior Software Engineer with 10+ years of experience specializing in backend systems and full-stack
            development. Proven track record of optimizing high-scale applications, reducing infrastructure costs, and
            implementing robust architectures. Expert in Elixir, Phoenix, and OTP, with a strong background in gaming
            and e-commerce platforms. Demonstrated ability to lead complex projects, improve system performance,
            and drive technological innovations in fast-paced environments.
          </p>
        <% :experience -> %>
          <%= for job <- [
            %{company: "Blitz.gg", role: "Senior Fullstack Engineer", location: "Los Angeles, CA", period: "July 2023 - September 2024", responsibilities: [
              "Implemented integrations for multiple popular games including Escape From Tarkov, Counter-Strike, and Fortnite",
              "Developed features to collect and process hundreds of millions of data points for enhanced player insights",
              "Redesigned game data architecture by creating a comprehensive generic system",
              "This abstraction significantly enhanced scalability, reduced code duplication, and streamlined the process of adding new game integrations"
            ]},
            %{company: "Discord", role: "Software Engineer", location: "San Francisco, CA", period: "October 2021 - May 2023", responsibilities: [
              "Maintained and improved core Elixir backend systems (Guilds, Relays, Sessions)",
              "Worked on the \"unlimited server size\" initiative to support more multi-million-member servers without causing user-visible performance issues",
              "Developed Python scripts to automate the deployment process",
              "Utilized Terraform for Infrastructure as Code (IaC), managing and provisioning GCP cloud resources"
            ]},
            %{company: "The RealReal", role: "Senior Software Engineer", location: "San Francisco, CA", period: "June 2019 - October 2021", responsibilities: [
              "Migrated the bank account information of 500,000 consignors over Stripe",
              "Moved the double digit millions monthly payments to Stripe",
              "Implemented identity and business verification as part of the \"Know Your Customer\" obligations in the Phoenix web client and the Elixir GraphQL API"
            ]},
            %{company: "Fewlines", role: "Software Engineer", location: "Lille, France", period: "October 2016 - June 2019", responsibilities: [
              "Built and maintained an authentication SaaS supporting the OAuth 2 RFC 6749 built in Elixir microservices and a Phoenix web client for the largest sporting goods retailer in the world",
              "Implemented typical login flows such as text and email and social login flows such as kakaotalk, line, etc."
            ]},
            %{company: "ThredUP", role: "Software Engineer", location: "San Francisco, CA", period: "September 2014 - October 2016", responsibilities: [
              "1st engineer to migrate an application to React in 2014 as a proof of concept",
              "Created the V2 of itemization, a core application used to gather data about an item, processing ~5000 items a week across 4 distribution centers",
              "Migrated all the remaining applications running in the distribution centers from Backbone/CoffeeScript to React/Flux consuming a Ruby On Rails API"
            ]}
          ] do %>
            <div class="mb-8">
              <h3 class="text-2xl font-bold text-white"><%= job.company %> | <%= job.role %></h3>
              <p class="text-lg text-blue-400"><%= job.location %> | <%= job.period %></p>
              <ul class="mt-2 text-gray-300 list-disc list-inside">
                <%= for responsibility <- job.responsibilities do %>
                  <li><%= responsibility %></li>
                <% end %>
              </ul>
            </div>
          <% end %>
        <% :skills -> %>
          <div class="grid grid-cols-2 gap-4">
            <div>
              <h3 class="text-xl font-bold text-white mb-2">Proficient</h3>
              <ul class="list-disc list-inside text-gray-300">
                <li>Elixir</li>
                <li>Phoenix</li>
                <li>OTP (Concurrency, Supervisor, Storage)</li>
                <li>Ecto</li>
                <li>JavaScript</li>
              </ul>
            </div>
            <div>
              <h3 class="text-xl font-bold text-white mb-2">Experienced</h3>
              <ul class="list-disc list-inside text-gray-300">
                <li>Terraform</li>
                <li>GCP</li>
                <li>PostgreSQL</li>
                <li>Python</li>
                <li>CI/CD</li>
              </ul>
            </div>
            <div class="col-span-2 mt-4">
              <h3 class="text-xl font-bold text-white mb-2">Exposure</h3>
              <ul class="list-disc list-inside text-gray-300">
                <li>Rust</li>
                <li>PureScript</li>
                <li>Haskell</li>
                <li>Ruby</li>
              </ul>
            </div>
          </div>
        <% :education -> %>
          <div class="mb-6">
            <h3 class="text-2xl font-bold text-white">Master of Science in Computer Science</h3>
            <p class="text-lg text-blue-400">CESI École d'Ingénieurs, France | September 2016</p>
          </div>
        <% :projects -> %>
          <div class="mb-6">
            <h3 class="text-2xl font-bold text-white">Stk v1</h3>
            <p class="text-lg text-blue-400"><a href="https://github.com/MehdiBeddiaf/stk/" class="hover:text-blue-300">github.com/MehdiBeddiaf/stk/</a> | 2018</p>
            <p class="mt-2 text-gray-300">A real-time stock quotes, charts and market overview built with PureScript and Halogen consuming financial data from the IEX API.</p>
            <ul class="mt-2 text-gray-300 list-disc list-inside">
              <li>Learned PureScript, a statically-typed functional programming language via the online book PureScript by Example.</li>
              <li>Learned Halogen, a type-safe library for building user interfaces in PureScript via the code examples.</li>
            </ul>
          </div>
      <% end %>
    </div>
    """
  end

  def handle_event("select_section", %{"id" => id}, socket) do
    {:noreply, assign(socket, active_section: String.to_existing_atom(id))}
  end
end