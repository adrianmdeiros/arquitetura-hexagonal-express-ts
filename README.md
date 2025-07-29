# 🛠️ Arquitetura Hexagonal
<div>
<img title="TypeScript" align="center" height="30" width="40" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/typescript/typescript-original.svg" />
<img title="Node.js" align="center" height="30" width="40" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" />
<img title="Express.js" align="center" height="30" width="40" src="https://icongr.am/devicon/express-original.svg?si40&color=ffffff" />
<img title="Prisma ORM" align="center" height="30" width="30" src="https://creazilla-store.fra1.digitaloceanspaces.com/icons/3256965/file-type-prisma-icon-md.png" />  
<img title="PostgreSQL" align="center" height="30" width="30" src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/postgresql/postgresql-original.svg" />  
</div>

---

A __Arquitetura Hexagonal__, também conhecida como *Ports and Adapters*, é uma abordagem de design que visa isolar o núcleo da aplicação das dependências externas, como bancos de dados, interfaces de usuário, serviços externos, entre outros. Isso facilita a manutenção, teste e evolução do software. 

## 🏗️ Estrutura

- **Núcleo da Aplicação** 🧩
  - Contém a lógica de negócio e as regras da aplicação.
  - É totalmente independente de detalhes técnicos externos.
  - Inclui as entidades, serviços de domínio e casos de uso.

- **Portas** 🚪
  - São as interfaces que definem como o núcleo interage com o mundo externo.
  - Podem ser entradas (Input Ports) ou saídas (Output Ports).

- **Adaptadores** 🔌
  - Implementam as portas para conectar o núcleo às tecnologias externas.
  - Podem ser adaptadores para bancos de dados, APIs REST, interfaces gráficas, etc.
  - Garantem que o núcleo permaneça desacoplado das ferramentas externas.

## 🔄 Fluxo de Dados

1. **Entrada** 🎮: Um evento externo aciona uma porta de entrada.
2. **Núcleo** 🧠: A lógica de negócio processa o evento, tomando decisões e realizando operações.
3. **Saída** 📤: Se necessário, o núcleo usa uma porta de saída para interagir com um sistema externo.

## 🎯 Benefícios

- **Desacoplamento** 🔗: A lógica de negócio não depende de frameworks ou tecnologias externas.
- **Testabilidade** 🧪: Fica mais fácil testar o núcleo sem precisar de componentes externos.
- **Facilidade de Mudança** 🔄: Mudanças nos adaptadores não afetam o núcleo da aplicação.

<br/>

### Diagrama de Contexto
<img src="./github/diagrama-de-contexto.png" alt="Diagrama de contexto do sistema." />

---

### Diagrama de Container
<img src="./github/diagrama-de-container.png" alt="Diagrama de container do sistema." />

---

### Diagrama de Componente
<img src="./github/diagrama-de-componente.png" alt="Diagrama de componente do sistema." />
