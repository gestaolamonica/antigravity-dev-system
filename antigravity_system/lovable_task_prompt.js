/**
 * Converts a frontend task object into an optimized prompt for the Lovable execution engine.
 * 
 * @param {Object} task - The task object derived from `task_schema.json`.
 * @param {string} task.context - Project architecture summary.
 * @param {string} task.goal - UI feature to implement.
 * @param {string} [task.constraints] - Technology stack and UI requirements (defaults to React/Tailwind/Responsive).
 * @param {string} [task.expected_output] - Expected return shape from Lovable.
 * @returns {string} - The optimized string prompt ready to be sent to Lovable.
 */
function lovable_task_prompt(task) {
  const constraints = task.constraints || "React\nTailwindCSS\nResponsive layout";
  const expectedOutput = task.expected_output || "Return React components and folder structure.";

  return `You are a frontend engineer.

Context: ${task.context}

Task:
${task.goal}

Constraints:
${constraints}

Expected Output:
${expectedOutput}`;
}

module.exports = {
  lovable_task_prompt
};
