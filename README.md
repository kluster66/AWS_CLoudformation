# Projet d'Infrastructure as Code (IaC) avec AWS

Ce projet est un bac à sable pour l'Infrastructure as Code (IaC) sur AWS, utilisant CloudFormation et Terraform.

## Structure du Projet

Le projet est organisé comme suit :

- **`Cloudformation/`**: Contient les templates AWS CloudFormation.
  - `Commandes_CloudFormation.txt`: Un aide-mémoire pour les commandes CloudFormation.
  - `Dirty_tests/`: Contient des templates de test.
    - `20180269cO-MyBouletNetwork.json`: Un template pour déployer une infrastructure réseau de base (VPC, subnets, etc.).

- **`IAM/`**: Contient les politiques IAM.
  - `Policies/`:
    - `EC2_T2Micro.json`: Une politique qui restreint les actions sur les instances EC2 de type `t2.micro`.

- **`terraform/`**: Contient les configurations Terraform.
  - `dirty_test/`: Configurations pour des tests rapides.
  - `up&running_exercices/`: Exercices Terraform.
  - `user_mgt/`: Gestion des utilisateurs.

- **`Diagramme sans nom.xml`** et **`Direct-connect.xml`**: Fichiers de diagrammes (probablement de draw.io ou similaire).

## Comment Utiliser

### CloudFormation

Pour déployer le template réseau :

1. **Validez le template :**
   ```bash
   aws cloudformation validate-template --template-body file://Cloudformation/Dirty_tests/20180269cO-MyBouletNetwork.json
   ```

2. **Déployez le stack :**
   ```bash
   aws cloudformation create-stack --stack-name MyNetworkStack --template-body file://Cloudformation/Dirty_tests/20180269cO-MyBouletNetwork.json --parameters ParameterKey=VpcCidr,ParameterValue=10.0.0.0/16 ParameterKey=PublicSubnetCidr,ParameterValue=10.0.1.0/24 ParameterKey=PrivateSubnetCidr,ParameterValue=10.0.2.0/24
   ```

### Terraform

Pour utiliser les configurations Terraform :

1. **Initialisez Terraform :**
   ```bash
   terraform init
   ```

2. **Planifiez les changements :**
   ```bash
   terraform plan
   ```

3. **Appliquez les changements :**
   ```bash
   terraform apply
   ```

## Axes d'Amélioration

- **Organisation des fichiers** : Séparer les environnements (`dev`, `prod`) et utiliser des modules Terraform pour le code réutilisable.
- **CloudFormation** : Utiliser des mappings pour les valeurs dépendant de la région et décomposer les templates en stacks imbriqués pour les infrastructures complexes.
- **Terraform** : Gérer l'état à distance avec un backend comme S3 et éviter d'ouvrir des ports à `0.0.0.0/0` dans les groupes de sécurité.
- **Politiques IAM** : Appliquer le principe du moindre privilège de manière stricte.
- **Documentation** : Améliorer ce `README.md` avec plus de détails sur chaque configuration.