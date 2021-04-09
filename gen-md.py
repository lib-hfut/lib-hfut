#####################################################################
# src: https://github.com/QSCTech/zju-icicles/blob/master/update.py #
#####################################################################

# encoding: uft-8
import os

EXCLUDE_DIRS = ['.git', 'docs', '.vscode', '.circleci', 'site']
README_MD = ['README.md', 'readme.md', 'index.md']

BIN_URL_PREFIX = 'https://github.com/lib-hfut/lib-hfut/raw/master/'


def list_files(course: str):
    filelist_texts = '## 文件列表\n\n'
    readme_path = ''
    for root, dirs, files in os.walk(course):
        level = root.replace(course, '').count(os.sep)
        indent = ' ' * 4 * level
        filelist_texts += '{}- {}\n'.format(indent, os.path.basename(root))
        subindent = ' ' * 4 * (level + 1)
        for f in files:
            if f not in README_MD:
                    filelist_texts += '{}- [{}]({})\n'.format(subindent,
                                                              f, '{}{}/{}'.format(BIN_URL_PREFIX, root,  f))
            else:
                readme_path = '{}/{}'.format(root, f)
    return filelist_texts, readme_path


def generate_md(course: str, filelist_texts: str, readme_path: str):
    final_texts = ['\n\n', filelist_texts]
    if readme_path:
        with open(readme_path, 'r', encoding='ISO-8859-1') as file:
            final_texts = file.readlines() + final_texts
    with open('docs/{}.md'.format(course), 'w', encoding='utf-8') as file:
        file.writelines(final_texts)


if __name__ == '__main__':
    courses = list(filter(lambda x: os.path.isdir(x) and (
        x not in EXCLUDE_DIRS), os.listdir('.')))  # list courses

    for course in courses:
        filelist_texts, readme_path = list_files(course)
        generate_md(course, filelist_texts, readme_path)
