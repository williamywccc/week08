location            = "Australia East"
resource_group_name = "koalatech-week10-rg"

# Globally unique names — change the suffix if apply fails due to name collision
acr_name             = "koalatechacrwinyip102"
storage_account_name = "koalatechstwinyip102"
aks_cluster_name     = "koalatech-aks-winyip102"
aks_dns_prefix       = "koalatech102"

# Smaller cluster for Task 9.1P to save Azure for Students credit
aks_node_count   = 2
aks_node_vm_size = "Standard_B2s_v2"

environment = "development"

tags = {
    Project     = "KoalaTech Course Platform"
    ManagedBy   = "Terraform"
    Practical   = "Week10"
    Environment = "Development"
}
