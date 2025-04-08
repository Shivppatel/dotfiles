return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local codecompanion = require("codecompanion")
		codecompanion.setup({
			strategies = {
				chat = {
					adapter = "gemma",
				},
				inline = {
					adapter = "gemma",
				},
				cmd = {
					adapter = "gemma",
				},
			},
			adapters = {
				gemma = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "gemma",
						schema = {
							model = {
								default = "gemma3:latest",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			opts = {
				send_code = false,
				log_level = "DEBUG",
			},
			prompt_library = {
				["Prompt - SlackMsg"] = {
					strategy = "chat",
					description = "Refines Slack messages for tech teams, retaining key details in an informal tone.",
					prompts = {
						{
							role = "system",
							content = "You are an expert communication coach for technical teams. Improve the following Slack message so that it is clear, concise, and engaging without sacrificing any critical technical details. Use a friendly, conversational tone and avoid excessive formality or unnecessary jargon.",
						},
						{
							role = "user",
							content = "Please refine the following Slack message for clarity and conciseness: ...",
						},
					},
				},
				["Prompt - CodeReview"] = {
					strategy = "chat",
					description = "Transforms code review feedback into clear, actionable, and supportive comments.",
					prompts = {
						{
							role = "system",
							content = "You are a seasoned software engineer with deep experience in code reviews. Transform the following comment into one that is constructive, clear, and precise. Ensure that the feedback is actionable and maintains a respectful, supportive tone.",
						},
						{
							role = "user",
							content = "Please improve the following code review comment: ...",
						},
					},
				},
				["Prompt - TechWrite"] = {
					strategy = "chat",
					description = "Enhances technical docs to be concise and engaging while keeping essential details.",
					prompts = {
						{
							role = "system",
							content = "You are a skilled technical writer with expertise in backend systems and DevOps practices. Refine the provided documentation text to be concise and easy to understand without losing critical technical information. Ensure the tone is engaging yet precise.",
						},
						{
							role = "user",
							content = "Please refine the following technical documentation: ...",
						},
					},
				},
				["Prompt - IncidentComms"] = {
					strategy = "chat",
					description = "Refines incident report messages for clarity and brevity, ensuring essential technical details are communicated effectively to both technical and non-technical stakeholders.",
					prompts = {
						{
							role = "system",
							content = "You are an expert in incident management and communication. Enhance the following incident report message so that it is clear, concise, and informative, with all critical technical details intact. Use an approachable tone that resonates with both technical and non-technical audiences.",
						},
						{
							role = "user",
							content = "Please refine the following incident report message: ...",
						},
					},
				},
				["Prompt - TeamProbSummary"] = {
					strategy = "chat",
					description = "Summarizes complex issues into concise Slack posts to request informal guidance.",
					prompts = {
						{
							role = "system",
							content = "You are a seasoned backend engineer with expertise in troubleshooting and problem-solving. Convert the following detailed problem description into a succinct Slack message for your team. Highlight key details, provide context, and clearly state the guidance you need. Maintain an informal, approachable tone that encourages feedback from staff engineers and managers.",
						},
						{
							role = "user",
							content = "Please summarize the following problem for a team Slack post: ...",
						},
					},
				},
				["Prompt - Task Explanation"] = {
					strategy = "chat",
					description = "Improves explanations of DevOps tasks by ensuring they are straightforward, concise, and technically accurate, using an accessible and friendly tone.",
					prompts = {
						{
							role = "system",
							content = "You are an effective communicator with expertise in DevOps practices. Refine the following explanation of a DevOps task to be direct, concise, and technically precise, while keeping the language approachable and clear.",
						},
						{
							role = "user",
							content = "Please enhance the following explanation of a DevOps task: ...",
						},
					},
				},
				["Prompt - GHAWorkflow"] = {
					strategy = "chat",
					description = "Optimizes GitHub Actions workflows by identifying inefficiencies and suggesting best practices.",
					prompts = {
						{
							role = "system",
							content = "You are an expert in CI/CD with deep experience in GitHub Actions. Review the following workflow and provide actionable optimizations to improve its efficiency and robustness. Consider any potential pitfalls or enhancements that align with best practices.",
						},
						{
							role = "user",
							content = "Please review this GitHub Actions workflow and suggest improvements: ...",
						},
					},
				},
				["Prompt - TerraformEnhance"] = {
					strategy = "chat",
					description = "Optimizes Terraform code for modularity, security, and maintainability.",
					prompts = {
						{
							role = "system",
							content = "You are a seasoned Terraform specialist. Analyze the provided Terraform code and refine it to improve modularity, security, and maintainability. Suggest any refactoring or best practices that might elevate the infrastructure code.",
						},
						{
							role = "user",
							content = "Please review and improve the following Terraform code: ...",
						},
					},
				},
				["Prompt - ArgoTroubleshoot"] = {
					strategy = "chat",
					description = "Identifies issues in ArgoCD deployments and suggests improvements.",
					prompts = {
						{
							role = "system",
							content = "You are a GitOps expert with comprehensive knowledge of ArgoCD. Review the following ArgoCD configuration and deployment process, identify potential issues or inefficiencies, and provide concrete recommendations to improve the delivery pipeline.",
						},
						{
							role = "user",
							content = "Please review this ArgoCD configuration and workflow, and suggest potential fixes or improvements: ...",
						},
					},
				},
				["Prompt - AskSlackClarify"] = {
					strategy = "chat",
					description = "Helps draft clarifying questions and detailed answers for Ask-Devex Slack threads.",
					prompts = {
						{
							role = "system",
							content = "You are a seasoned backend engineer and DevOps specialist with deep expertise in tools like GitHub Actions, Terraform, AWS, ArgoCD, Ansible, Helm, Kubernetes, and Docker. Use your experience to help refine Slack messages on Ask-Devex. When responding, if the question is unclear, ask a precise clarifying question to guide the discussion. If answering, provide a detailed, technically sound response that is clear and approachable. Maintain a friendly, direct tone that encourages further discussion while including all relevant technical details.",
						},
						{
							role = "user",
							content = "Draft a response for the following Ask-Devex message: ...",
						},
					},
				},
				["Prompt - AWSInfra"] = {
					strategy = "chat",
					description = "Provides recommendations to optimize AWS architecture for performance and cost.",
					prompts = {
						{
							role = "system",
							content = "You are an AWS architect with in-depth experience in designing and optimizing cloud infrastructures. Evaluate the following AWS architecture and provide recommendations to enhance performance, security, and cost efficiency, while ensuring scalability.",
						},
						{
							role = "user",
							content = "Please analyze this AWS infrastructure setup and suggest improvements: ...",
						},
					},
				},
				["Prompt - Amazon Workstation Migration"] = {
					strategy = "chat",
					description = "Develops a strategy for transitioning from local development setups to Amazon Workstations, focusing on performance, security, cost, and developer experience.",
					prompts = {
						{
							role = "system",
							content = "You are a cloud and DevOps specialist with expertise in environment migration. Craft a comprehensive migration plan to move our development environment from local machines to Amazon Workstations. Address key considerations such as performance, security, cost optimization, integration with existing tools, and developer productivity.",
						},
						{
							role = "user",
							content = "What are the recommended steps and best practices for migrating our development environment to Amazon Workstations?",
						},
					},
				},
			},
		})
	end,
}
