.PHONY: update-brew sync-brew

update-brew:
	@echo "Updating Brew"
	@brew update
	@echo "Upgrading Brew"
	@brew upgrade

sync-brew: update-brew
	@echo "🔄 Syncing Brewfile..."
	@rm -f ./Brewfile
	@echo "🗑️ Removed existing Brewfile."
	@brew bundle dump --file=./Brewfile --force
	@echo "✅ Generated new Brewfile."
