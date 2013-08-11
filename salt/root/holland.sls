app-backup/holland:
  pkg:
    - installed
    - version: 1.0.10
  portage_config.flags:
    - accept_keywords: [ ~ARCH ]
