defmodule BeddiafulWeb.ResumeLive do
  use BeddiafulWeb, :live_view
  alias BeddiafulWeb.ResumeData

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       sections: ResumeData.sections(),
       active_section: :current,
       timeline_items: ResumeData.timeline_items(),
       page_title: "Mehdi Beddiaf - Software Engineer"
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-[#F5F5DC] text-[#1B3655] py-12 px-4 sm:px-6 lg:px-8">
      <main class="max-w-7xl mx-auto" role="main">
        <header class="text-center mb-12">
          <h1 class="text-4xl font-extrabold text-[#1B3655] sm:text-5xl sm:tracking-tight lg:text-6xl">
            Mehdi Beddiaf
          </h1>
          <p class="mt-5 text-xl text-[#4A6741]">Software Engineer</p>
          <div class="mt-3 text-[#4A6741]">
            <p>
              Los Angeles, CA | <a href="tel:+14158826758" class="hover:underline">415-882-6758</a>
              |
              <a href="mailto:mehdi.beddiaf@gmail.com" class="hover:underline">
                mehdi.beddiaf@gmail.com
              </a>
            </p>
            <p>
              <a
                href="https://www.linkedin.com/in/mehdibeddiaf"
                target="_blank"
                rel="noopener noreferrer"
                class="hover:underline"
              >
                LinkedIn: /in/mehdibeddiaf
              </a>
              |
              <a
                href="https://beddiaful.dev"
                target="_blank"
                rel="noopener noreferrer"
                class="hover:underline"
              >
                Website: beddiaful.dev
              </a>
            </p>
          </div>
        </header>
        <nav
          aria-label="Resume sections"
          class="mt-12 grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4"
        >
          <%= for section <- @sections do %>
            <.section_button section={section} active_section={@active_section} />
          <% end %>
        </nav>
        <section class="mt-12 bg-[#E0D8C0] rounded-lg shadow-xl overflow-hidden">
          <div class="p-8">
            <%= case @active_section do %>
              <% :timeline -> %>
                <h2 class="text-3xl font-bold text-[#1B3655] mb-6">Career Timeline</h2>
                <.live_component
                  module={BeddiafulWeb.TimelineLive}
                  id="timeline"
                  timeline_items={@timeline_items}
                />
              <% _ -> %>
                <.section_content section={Enum.find(@sections, &(&1.id == @active_section))} />
            <% end %>
          </div>
        </section>
      </main>
    </div>
    """
  end

  def section_button(assigns) do
    ~H"""
    <button
      class={"flex items-center justify-center p-4 rounded-lg text-left transition-all duration-200 ease-in-out w-full #{if @active_section == @section.id, do: "bg-[#1B3655] text-[#F5F5DC]", else: "bg-[#4A6741] text-[#F5F5DC] hover:bg-[#5A7751]"}"}
      phx-click="select_section"
      phx-value-id={@section.id}
      aria-current={if @active_section == @section.id, do: "page", else: "false"}
      aria-controls="section-content"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-6 w-6 mr-3"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
        aria-hidden="true"
      >
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d={@section.icon} />
      </svg>
      <span class="text-lg font-medium"><%= @section.title %></span>
    </button>
    """
  end

  def section_content(assigns) do
    ~H"""
    <div id="section-content" class="prose max-w-none">
      <%= case @section.id do %>
        <% :current -> %>
          <h2 class="text-3xl font-bold text-[#1B3655] mb-6">What I'm Up To These Days</h2>
          <div class="space-y-4">
            <%= for activity <- ResumeData.current_activities() do %>
              <div class="flex items-start space-x-4">
                <span class="text-4xl flex-shrink-0"><%= activity.emoji %></span>
                <p class="text-[#1B3655] mt-1"><%= activity.activity %></p>
              </div>
            <% end %>
          </div>
        <% :summary -> %>
          <p class="text-xl text-[#1B3655]">
            Senior Software Engineer with 10+ years of experience in backend systems and full-stack development. At Discord, optimized real-time infrastructure for multi-million member servers, reducing cluster size by 67% and saving $370K annually. Implemented large-scale data migrations at The RealReal, including transitioning 500,000 consignors to Stripe. Proficient in Elixir, Phoenix, and OTP. Led development of core applications at ThredUP, processing 5,000 items weekly across multiple distribution centers. Expertise in high-scale systems, real-time applications, and e-commerce platforms.
          </p>
        <% :experience -> %>
          <%= for job <- ResumeData.timeline_items() do %>
            <article class="mb-8">
              <h3 class="text-2xl font-bold text-[#1B3655]"><%= job.company %> | <%= job.role %></h3>
              <p class="text-lg text-[#4A6741]"><%= job.period %></p>
              <ul class="mt-2 text-[#1B3655] list-disc list-inside">
                <%= for responsibility <- job.responsibilities do %>
                  <li><%= responsibility %></li>
                <% end %>
              </ul>
            </article>
          <% end %>
        <% :skills -> %>
          <div class="grid grid-cols-2 gap-4">
            <div>
              <h3 class="text-xl font-bold text-[#1B3655] mb-2">Proficient</h3>
              <ul class="list-disc list-inside text-[#1B3655]">
                <li>Elixir</li>
                <li>Phoenix</li>
                <li>OTP (Concurrency, Supervisor, Storage)</li>
                <li>Ecto</li>
                <li>JavaScript</li>
              </ul>
            </div>
            <div>
              <h3 class="text-xl font-bold text-[#1B3655] mb-2">Experienced</h3>
              <ul class="list-disc list-inside text-[#1B3655]">
                <li>Terraform</li>
                <li>GCP</li>
                <li>PostgreSQL</li>
                <li>Python</li>
                <li>CI/CD</li>
              </ul>
            </div>
            <div class="col-span-2 mt-4">
              <h3 class="text-xl font-bold text-[#1B3655] mb-2">Exposure</h3>
              <ul class="list-disc list-inside text-[#1B3655]">
                <li>Rust</li>
                <li>PureScript</li>
                <li>Haskell</li>
                <li>Ruby</li>
              </ul>
            </div>
          </div>
        <% :education -> %>
          <div class="mb-6">
            <h3 class="text-2xl font-bold text-[#1B3655]">Master of Science in Computer Science</h3>
            <p class="text-lg text-[#4A6741]">CESI École d'Ingénieurs, France | September 2016</p>
          </div>
        <% :projects -> %>
          <div class="mb-6">
            <h3 class="text-2xl font-bold text-[#1B3655]">Stk v1</h3>
            <p class="text-lg text-[#4A6741]">
              <a href="https://github.com/MehdiBeddiaf/stk/" class="hover:underline">
                github.com/MehdiBeddiaf/stk/
              </a>
              | 2018
            </p>
            <p class="mt-2 text-[#1B3655]">
              A real-time stock quotes, charts and market overview built with PureScript and Halogen consuming financial data from the IEX API.
            </p>
            <ul class="mt-2 text-[#1B3655] list-disc list-inside">
              <li>
                Learned PureScript, a statically-typed functional programming language via the online book PureScript by Example.
              </li>
              <li>
                Learned Halogen, a type-safe library for building user interfaces in PureScript via the code examples.
              </li>
            </ul>
          </div>
        <% :blog -> %>
          <div class="text-center py-12">
            <h2 class="text-3xl font-bold text-[#1B3655] mb-4">Blog Coming Soon!</h2>
            <p class="text-xl text-[#4A6741]">
              Stay tuned for insightful articles on Elixir, system design, and more.
            </p>
            <p class="text-lg text-[#1B3655] mt-4">
              Check back soon or follow me on social media for updates!
            </p>
          </div>
      <% end %>
    </div>
    """
  end

  def handle_event("select_section", %{"id" => id}, socket) do
    {:noreply, assign(socket, active_section: String.to_existing_atom(id))}
  end
end
