import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NgxGoogleAnalyticsModule } from '@hakimio/ngx-google-analytics';

@Component({
    selector: 'app-root',
    standalone: true,
    imports: [RouterModule, NgxGoogleAnalyticsModule],
    template: `
        <router-outlet></router-outlet>`
})
export class AppComponent {

}
