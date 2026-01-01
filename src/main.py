from prompts import prompts
from logger import panel
from logger import logger
from downloader import downloader

def main():
    panel('info', 'YT DOWNLOADER v1.0\nby: endgtryna')
    options = prompts()
    
    if options['mode'] == 'single':
        downloader(1, options['sources'], options['type'], options['save_path'])
    elif options['mode'] == 'bulk':
        for index, source in enumerate(options['sources'], 1):
            downloader(index, source, options['type'], options['save_path'])

    logger('info', 'Done...')
