defmodule BeddiafulWeb.TimelineLive do
  use BeddiafulWeb, :live_component

  def update(assigns, socket) do
    {:ok, assign(socket, assigns) |> assign_new(:expanded_job, fn -> nil end)}
  end

  def render(assigns) do
    ~H"""
    <div class="relative container mx-auto px-6 flex flex-col space-y-8">
      <div class="absolute z-0 w-1 h-full bg-blue-500 left-1/2 transform -translate-x-1/2"></div>
      <%= for {job, index} <- Enum.with_index(@timeline_items) do %>
        <div class="relative z-10 timeline-item" id={"job-#{index}"}>
          <div class="mt-6 sm:mt-0 sm:mb-12">
            <div class="flex flex-col sm:flex-row items-center">
              <div class={"flex #{if rem(index, 2) == 0, do: "justify-start", else: "justify-end"} w-full mx-auto items-center"}>
                <div class={"w-full sm:w-1/2 #{if rem(index, 2) == 0, do: "sm:pr-8", else: "sm:pl-8"}"}>
                  <div class="p-4 bg-gray-700 rounded shadow cursor-pointer hover:bg-gray-600 transition-colors duration-300"
                       phx-click="toggle_job"
                       phx-value-job={index}
                       phx-target={@myself}>
                    <h3 class="text-xl font-semibold text-white"><%= job.company %></h3>
                    <p class="text-blue-300"><%= job.role %></p>
                    <p class="text-gray-300 text-sm"><%= job.period %></p>
                    <%= if @expanded_job == index do %>
                      <div class="mt-4 text-gray-300">
                        <h4 class="font-semibold">Responsibilities:</h4>
                        <ul class="list-disc list-inside mt-2">
                          <%= for responsibility <- job.responsibilities do %>
                            <li><%= responsibility %></li>
                          <% end %>
                        </ul>
                      </div>
                    <% end %>
                  </div>
                </div>
              </div>
              <div class="rounded-full bg-blue-500 border-4 border-gray-900 w-8 h-8 absolute left-1/2 -translate-y-4 sm:translate-y-0 transform -translate-x-1/2 flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
              </div>
            </div>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  def handle_event("toggle_job", %{"job" => job_index}, socket) do
    job_index = String.to_integer(job_index)
    expanded_job = if socket.assigns.expanded_job == job_index, do: nil, else: job_index
    {:noreply, assign(socket, expanded_job: expanded_job)}
  end
end