FROM docker/sandbox-templates:claude-code
USER agent

# Marketplaces
RUN claude plugin marketplace add JuliusBrussee/caveman \
 && claude plugin marketplace add anthropics/claude-plugins-official

# Plugins
RUN claude plugin install caveman@caveman \
 && claude plugin install superpowers@claude-plugins-official \
 && claude plugin install code-review@claude-plugins-official
