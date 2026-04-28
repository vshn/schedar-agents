FROM docker/sandbox-templates:claude-code

USER root
RUN mkdir -p /opt/claude-config && chown agent:agent /opt/claude-config

USER agent
ENV CLAUDE_CONFIG_DIR=/opt/claude-config

# Marketplaces
RUN claude plugin marketplace add JuliusBrussee/caveman \
 && claude plugin marketplace add anthropics/claude-plugins-official

# Plugins
RUN claude plugin install caveman@caveman \
 && claude plugin install superpowers@claude-plugins-official \
 && claude plugin install code-review@claude-plugins-official
