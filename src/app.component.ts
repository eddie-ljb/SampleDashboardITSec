import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterModule],
    template: `
        <!-- Google tag (gtag.js) -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-KR1H528VQ8"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', 'G-KR1H528VQ8');
        </script>
        <router-outlet></router-outlet>`
})
export class AppComponent {}
