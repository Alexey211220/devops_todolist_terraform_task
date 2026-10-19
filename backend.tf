terraform {

  backend "azurerm" {
    storage_account_name = "Todoapp"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    resource_group_name  = "Todoapp-project"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.4.0"
    }
  }
}

provider "azurerm" {
  features {}
}
