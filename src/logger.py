from rich.panel import Panel
from rich.console import Console
from rich.theme import Theme

custom_theme = Theme({
    'primary': '#FFFFFF',
    'info': '#0046FF',
    'success': '#06923E',
    'error': '#DC0000'
})

console = Console(theme=custom_theme)

def logger(type, msg):
    console.print(f'[{type}]{msg}')

def panel(type, msg):
    console.print(Panel.fit(f'[{type}]{msg}'))

def spinner(type, msg):
    s = console.status(f'[{type}]{msg}', spinner='dots')
    s.start()
    return s
