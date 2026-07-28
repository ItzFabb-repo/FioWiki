import React from 'react';
import clsx from 'clsx';
import {useLocation} from '@docusaurus/router';
import {
  HtmlClassNameProvider,
  NavbarSecondaryMenuFiller,
  ThemeClassNames,
} from '@docusaurus/theme-common';
import {useNavbarMobileSidebar} from '@docusaurus/theme-common/internal';
import {
  DocsSidebarProvider,
  useDocRootMetadata,
} from '@docusaurus/plugin-content-docs/client';
import DocRootLayout from '@theme/DocRoot/Layout';
import DocSidebarItems from '@theme/DocSidebarItems';
import NotFoundContent from '@theme/NotFound/Content';

function MobileDocsSidebarMenu({sidebar, path}) {
  const mobileSidebar = useNavbarMobileSidebar();

  return (
    <ul className={clsx(ThemeClassNames.docs.docSidebarMenu, 'menu__list')}>
      <DocSidebarItems
        items={sidebar}
        activePath={path}
        onItemClick={(item) => {
          if ((item.type === 'category' && item.href) || item.type === 'link') {
            mobileSidebar.toggle();
          }
        }}
        level={1}
      />
    </ul>
  );
}

function MobileDocsSidebarFiller({sidebarItems}) {
  const {pathname} = useLocation();

  if (!sidebarItems) {
    return null;
  }

  return (
    <NavbarSecondaryMenuFiller
      component={MobileDocsSidebarMenu}
      props={{sidebar: sidebarItems, path: pathname}}
    />
  );
}

export default function DocRoot(props) {
  const currentDocRouteMetadata = useDocRootMetadata(props);
  if (!currentDocRouteMetadata) {
    return <NotFoundContent />;
  }
  const {docElement, sidebarName, sidebarItems} = currentDocRouteMetadata;

  return (
    <HtmlClassNameProvider className={clsx(ThemeClassNames.page.docsDocPage)}>
      <DocsSidebarProvider name={sidebarName} items={sidebarItems}>
        <MobileDocsSidebarFiller sidebarItems={sidebarItems} />
        <DocRootLayout>{docElement}</DocRootLayout>
      </DocsSidebarProvider>
    </HtmlClassNameProvider>
  );
}
