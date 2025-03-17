from os import system, name

def limpaTela():
    if name == 'nt':
        system('cls') 
    else:
        system('clear')

class caneta:
    def __init__(self, marca, cor):
        self.marca = marca
        self.cor = cor

    def escreverCaneta(self):
        print(f'\n A caneta {self.marca} de cor: {self.cor}, serve para escrever! \n')

#minhaCaneta = caneta('Bic', 'Azul')
#minhaCaneta.escreverCaneta()

canetas = []

while True:
    limpaTela()
    print(
    '\n Criador de canetas autmático: \n'
    '\n 1. Criar uma nova caneta',
    '\n 2. Escolha uma caneta',
    '\n 3. Sair',
    )

    op = input('\n Escolha uma opção: ')

    if op == '1':
        marca = input('\n Adicione uma marca: ')
        cor = input(' Adicione uma cor: ')
        nova_caneta = caneta(marca, cor)
        canetas.append(nova_caneta)
        input('\n Aperte "Enter" para continuar.')
    

    elif op == '2':
        if not canetas:
            print('\n Nenuhma caneta criada...')
        else:
            print('\n Lista de canetas: \n')
            for i, caneta in enumerate(canetas):
                print(f' {i + 1}. Marca: {caneta.marca}, Cor: {caneta.cor}')
                
            escolha = int(input('\n Escolha uma caneta: ')) - 1
            if 0 <= escolha < len(canetas):
                    canetas[escolha].escreverCaneta()
            else:
                print('\n Escolha inválida!')
        input('\n Aperte "Enter" para continuar.')

    elif op == '3':
        print('\n Saindo do programa...')
        break
    else:
        input('\n Opção inválida, aperte "Enter" para continuar.')