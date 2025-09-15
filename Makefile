.PHONY: sync-brew

sync-brew:
	@echo "🔄 Syncing Brewfile..."
	@rm -f ./Brewfile
	@echo "🗑️  Removed existing Brewfile."
	@brew bundle dump --file=./Brewfile --force
	@echo "✅ Generated new Brewfile."
