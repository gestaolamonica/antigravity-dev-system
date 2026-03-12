/**
 * Converts a backend task object into an optimized prompt for the Claude execution engine.
 * 
 * @param {Object} task - The task object derived from `task_schema.json`.
 * @param {string} task.context - Project architecture summary.
 * @param {string} task.goal - Specific backend feature/implementation request.
 * @param {string} [task.constraints] - Technology stack and rules (defaults to Node.js/Express/PG).
 * @param {string} [task.expected_output] - Expected return shape from Claude.
 * @returns {string} - The optimized string prompt ready to be sent to Claude.
 */
function claude_task_prompt(task) {
  const constraints = task.constraints || "Node.js\nExpress\nPostgreSQL\nREST API architecture";
  const expectedOutput = task.expected_output || "Return backend code, folder structure, and API endpoints.";

  return `You are a senior backend engineer.

Context: ${task.context}

Task: ${task.goal}

Constraints:
${constraints}

Expected Output:
${expectedOutput}`;
}

module.exports = {
  claude_task_prompt
};
